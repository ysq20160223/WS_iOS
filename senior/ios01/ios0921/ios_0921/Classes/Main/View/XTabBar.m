//
//  XTabBar.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XTabBar.h"

#import "UIView+X.h"

@interface XTabBar ()

@end



@implementation XTabBar

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)setTabBarItems:(NSArray<XTabBarButton *> *)tabBarItems {
    XLog
    _tabBarItems = tabBarItems;
    
    int i = 0;
    for (UITabBarItem *tabBarItem in tabBarItems) {
        XTabBarButton *btn = [XTabBarButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:tabBarItem.image forState:UIControlStateNormal];
        [btn setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
        
        // 监听点击
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        btn.tag = i++;
    }
    
    [self didClickBtn:self.subviews[0]];
}

- (void)didClickBtn:(UIButton *)btn {
    NSLog(@"%@", btn);
    
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        NSLog(@"%ld: %@", i, self.subviews[i]);
        if ([self.subviews[i] isKindOfClass:XTabBarButton.class]) {
            XTabBarButton *tabBarBtn = self.subviews[i];
            tabBarBtn.selected = tabBarBtn == btn;
        }
    }
    
    // 切换界面 - 通知 tabBarVc 切换界面
    if ([_xTabBarDelegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_xTabBarDelegate tabBar:self didClickBtn:btn.tag];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    XLog
    
    int count = (int)_tabBarItems.count;
    CGFloat x = 0;
    CGFloat y = 0;
    
    CGFloat w = self.xWidth / count;
    CGFloat h = self.xHeight;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        x = w * i;
        btn.frame = CGRectMake(x, y, w, h);
        btn.backgroundColor = XRandomColor();
    }
}

@end


