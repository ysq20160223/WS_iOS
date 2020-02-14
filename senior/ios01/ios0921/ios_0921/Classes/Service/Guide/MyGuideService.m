//
//  MyGuideService.m
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyGuideService.h"

#import "MySaveService.h"

#import "MyNewFeatureViewController.h"

#import "MyTabBarController.h"

#define MyVersionKey @"version"


@implementation MyGuideService

+ (UIViewController *)chooseRootViewController {
    UIViewController *rootVc = nil;
    
    // 1, 第一次使用 app 新的版本时候会显示新特性界面
    // 2, 判断是否有新的版本号
    // 3, 最新的版本号保存到 info.plist 文件
    // 获取当前版本号
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:MyVersionKey];
    //    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:MyVersionKey];
    
    //    NSLog(@"curVersion = %@, oldVersion = %@", curVersion, oldVersion);
    
    if ([curVersion isEqualToString:oldVersion] == NO) {
        
        [MySaveService setObject:curVersion forKey:MyVersionKey];
        //        [[NSUserDefaults standardUserDefaults] setObject:curVersion forKey:MyVersionKey];
        
        // 进入新特性界面
        MyNewFeatureViewController *newFeatureVc = [[MyNewFeatureViewController alloc] init];
        
        rootVc = newFeatureVc;
        
    } else {
        MyTabBarController *tabBarVc = [[MyTabBarController alloc] init];
        rootVc = tabBarVc;
        
    }
    
    //    NSLog(@"%@", NSHomeDirectory());
    
    return rootVc;
}

@end


