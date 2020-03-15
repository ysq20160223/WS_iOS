//
//  XTabBarController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/15.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "XTabBarController.h"

#import "UIImage+X.h"

@interface XTabBarController ()

@end



@implementation XTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"");
    [self setupTabBarItem];
    
    // 2-1
    [self addChildViewController:[[UINavigationController alloc] init] andTabBarItemTitle:@"Essence" andImageName:@"tabBar_essence_icon" andSelectedImageName:@"tabBar_essence_click_icon" andNavigationItemTitle:@"essence"];
    
    // 2-2
    [self addChildViewController:[[UINavigationController alloc] init] andTabBarItemTitle:@"New" andImageName:@"tabBar_new_icon" andSelectedImageName:@"tabBar_new_click_icon" andNavigationItemTitle:@"new"];
    
    // 2-3
    [self addChildViewController:[[UINavigationController alloc] init] andTabBarItemTitle:@"Trends" andImageName:@"tabBar_friendTrends_icon" andSelectedImageName:@"tabBar_friendTrends_click_icon" andNavigationItemTitle:@"trends"];
    
    // 2-4
    [self addChildViewController:[[UINavigationController alloc] init] andTabBarItemTitle:@"Me" andImageName:@"tabBar_me_icon" andSelectedImageName:@"tabBar_me_click_icon" andNavigationItemTitle:@"me"];
}

#pragma mark -
- (void)addChildViewController:(UIViewController *)viewController andTabBarItemTitle:(NSString *)tabBarItemTitle andImageName:(NSString *)imageName andSelectedImageName:(NSString *)selectedImageName andNavigationItemTitle:(NSString *)navItemTitle{
    
    viewController.tabBarItem.title = tabBarItemTitle;
    viewController.tabBarItem.image = [UIImage imageWithOriginalImageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageWithOriginalImageNamed:selectedImageName];
    
    UIViewController *rootVc = [[UIViewController alloc] init];
    [viewController addChildViewController:rootVc];
    if (nil != navItemTitle) {
        rootVc.navigationItem.title = navItemTitle;
    }
    rootVc.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:viewController];
}


- (void)setupTabBarItem {
    //    self.tabBar.barTintColor = [UIColor magentaColor]; // 包括全面屏底部安全区域
    //    self.tabBar.tintColor = [UIColor cyanColor];
    //    self.tabBar.unselectedItemTintColor = [UIColor orangeColor];
    self.tabBar.tintColor = XColor(81, 81, 81);
    self.tabBar.unselectedItemTintColor = XColor(139, 132, 129);
    
    NSMutableDictionary *normalTextAttrDict = [NSMutableDictionary dictionary];
    normalTextAttrDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectedTextAttrDict = [NSMutableDictionary dictionary];
    selectedTextAttrDict[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalTextAttrDict forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedTextAttrDict forState:UIControlStateSelected];
}

@end
