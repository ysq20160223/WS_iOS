//
//  MediaTabBarController.m
//  Media
//
//  Created by Apple on 2022/9/2.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "MediaTabBarController.h"

#import "MediaNavController.h"

#import "AudioListVc.h"
#import "VideoListVc.h"

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
    
    //
//    [self addChildVc:[MediaNavController.alloc initWithRootViewController:AudioListVc.alloc.init] imageName:@"tab_home" selectedImageName:@"tab_home" tabBarItemTitle:@"Home"];

    [self addChildVc:[MediaNavController.alloc initWithRootViewController:AudioListVc.alloc.init] imageName:@"tab_audio" selectedImageName:@"tab_audio" tabBarItemTitle:@"Audio"];
    
    [self addChildVc:[MediaNavController.alloc initWithRootViewController:VideoListVc.alloc.init] imageName:@"tab_video" selectedImageName:@"tab_video" tabBarItemTitle:@"Video"];
    
    
    //
    MediaTabBar *mediaTabBar = [MediaTabBar.alloc init];
    mediaTabBar.backgroundColor = commonBgColor;

    [self setValue:mediaTabBar forKey:@"tabBar"];
    [mediaTabBar _init];
}


- (void)addChildVc:(MediaNavController *)nc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName tabBarItemTitle:(NSString *)title  {
    nc.tabBarItem.image = [UIImage imageNamed:imageName];
    nc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    nc.tabBarItem.title = title;
    nc.view.backgroundColor = XRandomColor();
//    nc.view.backgroundColor = commonBgColor;
    [self addChildViewController:nc];
}

@end


