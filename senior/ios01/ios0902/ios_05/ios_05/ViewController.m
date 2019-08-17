//
//  ViewController.m
//  ios_05
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 01, 设置应用程序图标的提醒数字
 02, 设置联网的提示
 03, 设置状态栏
 04, 拨打电话, 发短信, 打开网页
 
 */

#import "ViewController.h"

@interface ViewController () {
    UIApplication *_app;
}
@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _app = [UIApplication sharedApplication];
    _app.applicationIconBadgeNumber = 9; // 01, 应用程序图标的提示数字
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [_app registerUserNotificationSettings:setting];
    
    // 02, 联网
//    _app.networkActivityIndicatorVisible = YES;
    [_app setNetworkActivityIndicatorVisible:YES];
    
}

// 隐藏状态栏
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}


// 03, 状态栏
- (IBAction)setStatusBar:(UIButton *)sender {
    if ([_app isStatusBarHidden]) {
        [_app setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    } else {
        [_app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}


// 04, 打开网页
- (IBAction)openUrl:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http:www.baidu.com"];
//    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    
    [_app openURL:url];
}


@end





