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
    self.tintColor = XColor(255, 0, 255);
    self.unselectedItemTintColor = XColor(204, 204, 204);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnW = self.frame.size.width / 1;
    CGFloat btnH = self.frame.size.height;
    
    NSInteger index = 0;
    NSInteger btnX = 0;
    for (UIView *subView in self.subviews) {
        if ([subView class] != NSClassFromString(@"UITabBarButton")) {
            return;
        }
        
        btnX = btnW * index;
        subView.frame = CGRectMake(btnX, 0, btnW, btnH);
        subView.backgroundColor = XRandomColor();
        
        index++;
    }
}

@end
