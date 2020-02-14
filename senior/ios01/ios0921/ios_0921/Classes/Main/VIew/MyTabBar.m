//
//  MyTabBar.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyTabBar.h"
#import "MyTabBarButton.h"

#import "UIView+Frame.h"

@interface MyTabBar ()

@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation MyTabBar

- (void)setItems:(NSArray *)items {
    _items = items;
    
    int i = 0;
    for (UITabBarItem *item in items) {
        MyTabBarButton *btn = [MyTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i;
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        // 监听点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        i++;
        // 默认选中第一个按钮
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        
        [self addSubview:btn];
    }
    
}

- (void)btnClick:(UIButton *)btn {
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    
    // 切换界面 - 通知 tabBarVc 切换界面
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:btn.tag];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int count = (int)_items.count;
    CGFloat x = 0;
    CGFloat y = 0;
    
    CGFloat w = self.width / count;
    CGFloat h = self.height;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        x = w * i;
        btn.frame = CGRectMake(x, y, w, h);
    }
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}

@end



