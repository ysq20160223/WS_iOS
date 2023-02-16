//
//  XArenaNc.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XArenaNc.h"

@interface XArenaNc ()

@end



@implementation XArenaNc

+ (void)load {
    // 获取当前类下的所有导航条
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    UIImage *img = [UIImage imageNamed:@"NLArenaNavBar64"];
    img = [img stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.5];
    [navBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}

@end
