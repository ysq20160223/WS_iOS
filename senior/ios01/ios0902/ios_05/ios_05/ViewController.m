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
//    UIApplication *_app;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _app = [UIApplication sharedApplication];
}

// 隐藏状态栏
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}


// 应用程序图标的提示数字
- (IBAction)badge:(UIButton *)sender {
    XLog
    
    if(UIApplication.sharedApplication.applicationIconBadgeNumber) {
        UIApplication.sharedApplication.applicationIconBadgeNumber = 0;
    } else {
        UIApplication.sharedApplication.applicationIconBadgeNumber = 1;
    }
}

- (IBAction)notification:(UIButton *)sender {
    XLog
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [UIApplication.sharedApplication registerUserNotificationSettings:settings];
    
}

- (IBAction)networkVisible:(UIButton *)sender {
//    NSLog(@"visible: %d", _app.networkActivityIndicatorVisible);
//    if (_app.networkActivityIndicatorVisible) {
//        _app.networkActivityIndicatorVisible = NO;
//    } else {
//        _app.networkActivityIndicatorVisible = YES;
//    }
    
    
    UIApplication.sharedApplication.networkActivityIndicatorVisible = !UIApplication.sharedApplication.networkActivityIndicatorVisible;
}


// 03, 状态栏
- (IBAction)setStatusBar:(UIButton *)sender {
//    if ([_app isStatusBarHidden]) {
//        [_app setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
//    } else {
//        [_app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
//    }
    
    
    [UIApplication.sharedApplication setStatusBarHidden:!UIApplication.sharedApplication.isStatusBarHidden withAnimation:UIStatusBarAnimationSlide];
}

// 04, 打开网页
- (IBAction)openUrl:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    //    NSURL *url = [NSURL URLWithString:@"tel://10086"];
//    [_app openURL:url];
    
    
    NSMutableDictionary<UIApplicationOpenExternalURLOptionsKey, id> *dict = [NSMutableDictionary dictionary];
    [UIApplication.sharedApplication openURL:url options:dict completionHandler:^(BOOL success) {
        NSLog(@"success: %d", success);
    }];
}


@end


