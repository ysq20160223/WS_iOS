//
//  MediaTabBarController.m
//  Media
//
//  Created by Apple on 2022/9/2.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "MediaTabBarController.h"

#import "MediaNavController.h"
#import "HomeVc.h""
#import "MediaTabBar.h"
#import "Config.h"


@interface MediaTabBarController ()

@end



@implementation MediaTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"%@; %@", self.loginUser, self.companyModel);
//    NSLog(@"frame: %@", NSStringFromCGRect(self.view.frame));
    
    [self addChildVc:[MediaNavController.alloc initWithRootViewController:[HomeVc.alloc init]] imageName:@"tab_bar_field_field" selectedImageName:@"tab_bar_field_field_selected" tabBarItemTitle:@"Home"];
    
}

- (void)addChildVc:(MediaNavController *)nc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName tabBarItemTitle:(NSString *)title  {
    nc.tabBarItem.image = [UIImage imageNamed:imageName];
    nc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    nc.tabBarItem.title = title;
//    nc.view.backgroundColor = XRandomColor();
    nc.view.backgroundColor = commonBgColor;
    [self addChildViewController:nc];
}

@end


