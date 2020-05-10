//
//  SeePigViewController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/26.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Photos/Photos.h>

#import "SeePigViewController.h"
#import "TopicModel.h"
#import "UIView+X.h"

#import "UIImageView+WebCache.h"

#import "MBProgressHUD.h"



@interface SeePigViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *btnSavePic;


@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@end



@implementation SeePigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self authorizationStatus:nil block:^{
        [self getOrCreateAssetCollection];
    }];
    
    self.view.backgroundColor = XColor(0x00, 0x00, 0x00);
//    NSLog(@"%@", self.topicModel);
    
    self.scrollView.frame = [UIScreen mainScreen].bounds;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    
    imageView.xWidth = kScreenW;
    imageView.xHeight = self.topicModel.height * kScreenW / self.topicModel.width;
//    NSLog("%@", NSStringFromCGRect(imageView.frame));
//    NSLog(@"%@", NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    if (imageView.xHeight > self.scrollView.xHeight) {
        self.scrollView.contentSize = CGSizeMake(0, 55 + imageView.xHeight);
    } else {
        imageView.xCenterY = self.scrollView.xHeight * 0.5;
    }
    imageView.xCenterX = self.scrollView.xCenterX;
    
    [self.scrollView insertSubview:imageView atIndex:0];
    self.scrollView.delegate = self;
    
    CGFloat scaleW = self.topicModel.width / imageView.xWidth;
    if (scaleW > 1) {
        self.scrollView.maximumZoomScale = scaleW;
    }
    CGFloat scaleH = self.topicModel.height / imageView.xHeight;
    if (scaleH > 1) {
        self.scrollView.maximumZoomScale = scaleH;
    }
    
    // download
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.topicModel.largeImg] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            NSLog(@"error: %@", error);
        } else {
            self.image = image;
            self.btnSavePic.hidden = NO;
        }
    }];
}

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//
- (void)authorizationStatus:(UIButton *)sender block:(void (^)(void))block {
    // 112301
//    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // 112302
    switch ([PHPhotoLibrary authorizationStatus]) {
        case PHAuthorizationStatusDenied:
            NSLog(@"PHAuthorizationStatusDenied");
            break;
            
        case PHAuthorizationStatusRestricted:
            NSLog(@"PHAuthorizationStatusRestricted");
            break;
            
        case PHAuthorizationStatusAuthorized:
//            [self saveImage];
            block();
            break;
            
        
        case PHAuthorizationStatusNotDetermined:
//            XLog
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (PHAuthorizationStatusDenied == status) {
                    NSLog(@"PHAuthorizationStatusDenied");
                } else if (PHAuthorizationStatusAuthorized == status) {
//                    XLog
//                    [self saveImage];
                    block();
                }
            }];
            break;
    }
}

- (IBAction)clickBtnSavePic:(UIButton *)sender {
    // 112301
//    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // 112302 - 使用block封装
    [self authorizationStatus:sender block:^{
        [self saveImage];
    }];
}

// 112302
- (void)saveImage {
    // PHAssetCollection 的标识, 利用这个标识可以找到对应的 PHAssetCollection 对象
    __block NSString *assetLocalIdentifier;
    
    // 1, 保存图片到 "相机胶卷"
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        NSLog(@"%@", [NSThread currentThread]);
        
        // 创建图片的请求
        assetLocalIdentifier = [PHAssetCreationRequest creationRequestForAssetFromImage:self.image].placeholderForCreatedAsset.localIdentifier;
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        NSLog(@"%@", assetLocalIdentifier);
        if(error) {
            NSLog(@"creationRequestForAssetFromImage Failure: %@", error);
            return;
        }
        
        // 2, 获得相簿
        PHAssetCollection *getOrCreateAssetCollection = [self getOrCreateAssetCollection];
        XLog
        if (getOrCreateAssetCollection) {
            NSLog(@"getOrCreateAssetCollection Success");
            
            // 3, 添加刚保存到 "相机胶卷" 中的图片, 到 "相簿" 中
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                XLog
                // 获取图片
                PHAsset *asset = [PHAsset fetchAssetsWithLocalIdentifiers:@[assetLocalIdentifier] options:nil].lastObject;

                // 添加图片到相簿中的请求
                PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:getOrCreateAssetCollection];

                // 添加图片到相簿
                [request addAssets:@[asset]];
                XLog
            } completionHandler:^(BOOL success, NSError * _Nullable error) {
                if(!success) {
                    NSLog(@"Add Photo to AssetCollection Failure: %@", error);
                    [self showInfo:[NSString stringWithFormat:@"Save Failure: %@", error]];
                    return;
                } else {
                    [self showInfo:@"Save Success"];
                    NSLog(@"Add Photo to AssetCollection Success");
                }
            }];
        } else {
            NSLog(@"getOrCreateAssetCollection Failure");
        }
    }];
}

// 获得创建过相簿
- (PHAssetCollection *)getOrCreateAssetCollection {
    PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    NSLog(@"%@", assetCollections);
    // 遍历是否创建过相簿
    for (PHAssetCollection *assetCollection in assetCollections) {
        if ([assetCollection.localizedTitle isEqualToString:@"BSAssetCollection"]) {
            NSLog(@"AssetCollection Created");
            return assetCollection;
        }
    }
    
    // 新创建相簿
    // PHAssetCollection 的标识, 利用这个标识可以找到对应的 PHAssetCollection 对象
    __block NSString *assetCollectionLocalIdentifier;
    
    NSError *error = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        // 创建相簿的请求
        assetCollectionLocalIdentifier = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:@"BSAssetCollection"].placeholderForCreatedAssetCollection.localIdentifier;
        NSLog(@"%@", assetCollectionLocalIdentifier);
    } error:&error];
    if (error) {
        NSLog(@"error: %@", error);
        return nil;
    }
    NSLog(@"%@", assetCollectionLocalIdentifier);
    PHAssetCollection *assetCollection = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[assetCollectionLocalIdentifier] options:nil].lastObject;
    NSLog(@"%@", assetCollection);
    return assetCollection;
}

- (void)showInfo:(NSString *)info {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.mode = MBProgressHUDModeCustomView;
        hud.animationType = MBProgressHUDAnimationFade;
        hud.backgroundView.color = [UIColor colorWithWhite:0.3f alpha:0.3f];
        [hud hideAnimated:YES afterDelay:1.5];
        hud.label.text = info;
    });
}

// 112301
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
//    XLog
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.mode = MBProgressHUDModeCustomView;
    hud.animationType = MBProgressHUDAnimationFade;
    hud.backgroundView.color = XColorAlpha(0, 0, 0, 0.3);
    [hud showAnimated:YES];
    if (error) {
        hud.label.text = @"Failure";
    } else {
        hud.label.text = @"Success";
    }
    [hud hideAnimated:YES afterDelay:1.5];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    XLog
    return self.imageView;
}

@end


