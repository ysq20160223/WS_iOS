//
//  TopicPicView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/21.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TopicPicView.h"
#import "TopicModel.h"

#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

#import "SeePigViewController.h"

@interface TopicPicView ()

@property (weak, nonatomic) IBOutlet UIImageView *ivPic;
@property (weak, nonatomic) IBOutlet UIImageView *ivGif;
@property (weak, nonatomic) IBOutlet UIButton *btnSeeBig;

@end



@implementation TopicPicView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    self.ivPic.userInteractionEnabled = YES;
//    [self.ivPic addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(ivPicClick:)]];
//
    self.ivPic.userInteractionEnabled = YES;
    [self.ivPic addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ivPicClick)]];
}

- (void)ivPicClick {
//    NSLog(@"%@", self.topicModel);
    SeePigViewController *seePigVc = [[SeePigViewController alloc] init];
    seePigVc.topicModel = self.topicModel;

    // present
    [[UIApplication sharedApplication].windows[0].rootViewController presentViewController:seePigVc animated:YES completion:nil];
    
    // push
//    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
//    UINavigationController *navController = tabBarController.selectedViewController;
//    [navController pushViewController:seePigVc animated:YES];
}

- (void)setTopicModel:(TopicModel *)topicModel {
    _topicModel = topicModel;
    
    self.ivPic.hidden = YES;
    self.ivGif.hidden = !topicModel.is_gif;
    self.btnSeeBig.hidden = !topicModel.isBigPic;
    
    if (topicModel.isBigPic) {
        self.ivPic.contentMode = UIViewContentModeTop;
//        self.ivPic.contentMode = UIViewContentModeScaleToFill; // 填充wh
//        self.ivPic.contentMode = UIViewContentModeScaleAspectFit; // 按wh比例完全显示
//        self.ivPic.contentMode = UIViewContentModeCenter; // 
    } else {
        self.ivPic.contentMode = UIViewContentModeScaleToFill;
    }
    
    switch ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus) {
        case AFNetworkReachabilityStatusReachableViaWWAN:
        case AFNetworkReachabilityStatusUnknown:
        case AFNetworkReachabilityStatusReachableViaWiFi: {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.ivPic sd_setImageWithURL:[NSURL URLWithString:topicModel.largeImg] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
               
                    //        NSLog(@"%ld; %ld", receivedSize, expectedSize);
                } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    self.ivPic.hidden = NO;
                    //        NSLog(@"");
                }];
            });
        }
            break;
            
        case AFNetworkReachabilityStatusNotReachable:
            XLog
            break;
    }
}

@end


