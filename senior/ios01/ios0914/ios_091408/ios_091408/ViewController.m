//
//  ViewController.m
//  ios_091408
//
//  Created by Apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "DrawView.h"



@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet DrawView *drawView;

@property (weak, nonatomic) IBOutlet UIButton *btnLeftColor;
@property (weak, nonatomic) IBOutlet UIButton *btnCenterColor;
@property (weak, nonatomic) IBOutlet UIButton *btnRightColor;

@end



@implementation ViewController

// 清空
- (IBAction)clear:(UIBarButtonItem *)sender {
    [self.drawView clear];
}

// 撤销
- (IBAction)undo:(UIBarButtonItem *)sender {
    [self.drawView undo];
}

// 擦除
- (IBAction)erase:(UIBarButtonItem *)sender {
    [self.drawView erase];
}

// 选中图片
- (IBAction)photos:(UIBarButtonItem *)sender {
    NSLog(@"");
    UIImagePickerController *pickVC = UIImagePickerController.alloc.init;
    
    pickVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; // 设置照片的来源
    pickVC.delegate = self;
    
    [self presentViewController:pickVC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate start
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSLog(@"info: %@", info);
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/Apple/Desktop/iOS091408.png" atomically:YES];
    
    NSLog(@"writeToFile success");
    
    [self dismissViewControllerAnimated:YES completion:nil]; //
}
#pragma mark - UIImagePickerControllerDelegate end

// 保存
- (IBAction)save:(UIBarButtonItem *)sender {
    // 1, 把画板东西生成一张图片保存
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.drawView.layer renderInContext:ctx];
    
    // 生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 写到系统相册当中
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // [access] This app has crashed because it attempted to access privacy-sensitive data without a usage description.
    // The app's Info.plist must contain an NSPhotoLibraryUsageDescription key with a string value explaining to the user how the app uses this data.
}

// Adds a photo to the saved photos album.  The optional completionSelector should have the form:
//  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"UIImageWriteToSavedPhotosAlbum success");
}


// -----
- (IBAction)valueChanged:(UISlider *)sender {
    [self.drawView setLineWidth:sender.value];
}

// 设置颜色
- (IBAction)setColor:(UIButton *)sender {
    //    NSLog(@"sender: %@", sender);
    [self.drawView setLineColor:sender.backgroundColor];
    
    if (sender == self.btnLeftColor) {
        self.btnLeftColor.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor;
        self.btnCenterColor.layer.borderColor = self.btnCenterColor.backgroundColor.CGColor;
        self.btnRightColor.layer.borderColor = self.btnRightColor.backgroundColor.CGColor;
    } else if (sender == self.btnCenterColor) {
        self.btnLeftColor.layer.borderColor = self.btnLeftColor.backgroundColor.CGColor;
        self.btnCenterColor.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor;
        self.btnRightColor.layer.borderColor = self.btnRightColor.backgroundColor.CGColor;
    } else if (sender == self.btnRightColor) {
        self.btnLeftColor.layer.borderColor = self.btnLeftColor.backgroundColor.CGColor;
        self.btnCenterColor.layer.borderColor = self.btnCenterColor.backgroundColor.CGColor;
        self.btnRightColor.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor;
    }
}


- (void)initColorBtn:(UIButton *)btn {
    [btn.layer setCornerRadius:btn.frame.size.height * 0.5];
    btn.layer.borderWidth = 2;
    btn.layer.borderColor = btn.backgroundColor.CGColor;
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initColorBtn:self.btnLeftColor];
    [self initColorBtn:self.btnCenterColor];
    [self initColorBtn:self.btnRightColor];
    
    [self setColor:self.btnLeftColor];
}

@end


