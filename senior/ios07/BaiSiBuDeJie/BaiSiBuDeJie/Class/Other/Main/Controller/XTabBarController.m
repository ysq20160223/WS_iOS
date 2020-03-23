//
//  XTabBarController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/15.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "XTabBarController.h"

#import "UIImage+X.h"

#import "XUITabBar.h"

#import "EssenceViewController.h"
#import "MeViewController.h"

#import "XNavController.h"

@interface XTabBarController ()

@end



@implementation XTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    XLog
    
    // 2-1
    [self addChildViewController:[[XNavController alloc] initWithRootViewController:[[EssenceViewController alloc] init]] andTabBarItemTitle:@"Essence" andImageName:@"tabBar_essence_icon" andSelectedImageName:@"tabBar_essence_click_icon"];
    
    // 2-4
    [self addChildViewController:[[XNavController alloc] initWithRootViewController:[[MeViewController alloc] init]] andTabBarItemTitle:@"Me" andImageName:@"tabBar_me_icon" andSelectedImageName:@"tabBar_me_click_icon"];
    
    //
    XUITabBar *tabBar = [[XUITabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"]; // 自定义 XUITabBar 替换系统 UITabBar
    [tabBar setupTabBarItem];
}

#pragma mark -
- (void)addChildViewController:(UIViewController *)viewController andTabBarItemTitle:(NSString *)tabBarItemTitle andImageName:(NSString *)imageName andSelectedImageName:(NSString *)selectedImageName{
    
    viewController.tabBarItem.title = tabBarItemTitle;
    viewController.tabBarItem.image = [UIImage imageWithOriginalImageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageWithOriginalImageNamed:selectedImageName];
    
    [self addChildViewController:viewController];
}

@end


