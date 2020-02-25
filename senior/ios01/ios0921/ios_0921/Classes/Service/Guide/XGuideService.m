//
//  MyGuideService.m
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XGuideService.h"

#import "XSaveService.h"

#import "XNewFeatureViewController.h"

#import "XTabBarController.h"

#define kVersionKey @"version"


@implementation XGuideService

static XTabBarController *extracted() {
    return [XTabBarController alloc];
}

+ (UIViewController *)chooseRootViewController {
    UIViewController *rootVc = nil;
    
    // 1, 第一次使用 app 新的版本时候会显示新特性界面
    // 2, 判断是否有新的版本号
    // 3, 最新的版本号保存到 info.plist 文件
    // 获取当前版本号
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kVersionKey];
    NSString *oldVersion = [XSaveService objectForKey:kVersionKey];
//    NSLog(@"curVersion: %@, oldVersion = %@", curVersion, oldVersion);
    
    
//    rootVc = [[XNewFeatureViewController alloc] init]; //
    
    if ([curVersion isEqualToString:oldVersion] == NO) {
        [XSaveService setObject:curVersion forKey:kVersionKey];
        //        [[NSUserDefaults standardUserDefaults] setObject:curVersion forKey:MyVersionKey];

        // 进入新特性界面
        rootVc = [[XNewFeatureViewController alloc] init];
    } else {
        rootVc = [extracted() init];
    }
    return rootVc;
}

@end


