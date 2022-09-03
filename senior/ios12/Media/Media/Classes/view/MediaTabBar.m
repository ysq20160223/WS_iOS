//
//  MediaTabBar.m
//  Media
//
//  Created by Apple on 2022/9/2.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "MediaTabBar.h"


@implementation MediaTabBar

- (void)_init {
    XLog
    self.tintColor = XColor(218, 65, 47);
    self.unselectedItemTintColor = XColor(0x99, 0x99, 0x99);
    
    self.backgroundColor = XColor(0x35, 0x36, 0x37);
//    self.backgroundColor = XColor(0, 0x88, 0xff);
    self.backgroundImage = [UIImage imageNamed:@"navigationbarBackgroundWhite"];

    /// 设置 TabBar 颜色
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = UITabBarAppearance.alloc.init;
//        appearance.configureWithOpaqueBackground;
        appearance.backgroundColor = self.backgroundColor;
        self.standardAppearance = appearance;
        if (@available(iOS 15.0, *)) {
            self.scrollEdgeAppearance = appearance;
        }
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger tabBarButtonCount = 0;
    for (UIView *subView in self.subviews) {
//        NSLog(@"%@", [subView class])
        if ([subView class] != NSClassFromString(@"UITabBarButton")) {
            continue;
        }
        tabBarButtonCount++;
    }
//    NSLog(@"tabBarButtonCount: %ld", tabBarButtonCount)

    
    CGFloat btnW = self.frame.size.width / tabBarButtonCount;
//    CGFloat btnH = self.frame.size.height;
    
    NSInteger index = 0;
    NSInteger btnX = 0;
    
    for (UIView *subView in self.subviews) {
        if ([subView class] != NSClassFromString(@"UITabBarButton")) {
            continue;
        }
        
        btnX = btnW * index;
        subView.frame = CGRectMake(btnX, 0, btnW, subView.frame.size.height);
//        subView.backgroundColor = XColor(0, 0xff, 0xff);
        
        index++;
    }
}

@end
