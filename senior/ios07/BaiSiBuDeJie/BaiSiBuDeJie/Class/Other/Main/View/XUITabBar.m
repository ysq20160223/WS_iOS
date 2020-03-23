//
//  XUITabBar.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/16.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "XUITabBar.h"

@interface XUITabBar()

@property (nonatomic, weak) UIButton *publishBtn;

@end



@implementation XUITabBar

- (void)setupTabBarItem {
    
    // 包括全面屏底部安全区域(当 UITabBar 设置过 backgroundImage 后无效)
//    self.barTintColor = [UIColor magentaColor];
    
//    self.tintColor = [UIColor cyanColor];
//    self.unselectedItemTintColor = [UIColor orangeColor];
    self.tintColor = XColor(81, 81, 81);
    self.unselectedItemTintColor = XColor(139, 132, 129);
    
    NSMutableDictionary *normalTextAttrDict = [NSMutableDictionary dictionary];
    normalTextAttrDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectedTextAttrDict = [NSMutableDictionary dictionary];
    selectedTextAttrDict[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalTextAttrDict forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedTextAttrDict forState:UIControlStateSelected];
}

// 布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    //    XLog
    
    CGFloat btnW = self.frame.size.width / 3;
    CGFloat btnH = self.frame.size.height;
    int btnIndex = 0;
    //    NSLog(@"w: %f; h: %f", self.frame.size.width, self.frame.size.height);
    
    // NSClassFromString(@"UITabBarButton") == [UITabBarButton class]
    for (UIView *subView in self.subviews) {
        // 1
        //        if (![@"UITabBarButton" isEqualToString:NSStringFromClass(subView.class)]) {
        //            continue;
        //        }
        
        // 2
        if (subView.class != NSClassFromString(@"UITabBarButton")) {
            continue;
        }
        
        CGFloat btnX = btnIndex * btnW;
        if (btnIndex >= 1) {
            btnX += btnW;
        }
        subView.frame = CGRectMake(btnX, 0, btnW, btnH);
        
        btnIndex++;
    }
    
    self.publishBtn.frame = CGRectMake(0, 0, btnW, btnH);
    self.publishBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}

#pragma mark init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

#pragma mark - lazy load
- (UIButton *)publishBtn {
    if (!_publishBtn) {
        UIButton *publishBtn = [[UIButton alloc] init];
        //        publishBtn.backgroundColor = BSRandomColorRGB;
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishBtn sizeToFit];
        
        // 监听点击
        [publishBtn addTarget:self action:@selector(publishBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishBtn];
        
        _publishBtn = publishBtn;
    }
    return _publishBtn;
}

// 处理点击事件
- (void)publishBtnClick:(UIButton *)publishBtn {
    XLog
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end


