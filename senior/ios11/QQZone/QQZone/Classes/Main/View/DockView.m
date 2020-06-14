//
//  DockView.m
//  QQZone
//
//  Created by Apple on 2020/6/8.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "DockView.h"

#import "BottomMenuView.h"
#import "TabBarView.h"
#import "IconBtn.h"

// category
#import "UIView+X.h"

#import "Const.h"

@interface DockView ()

//@property (nonatomic, strong) BottomMenuView *bottomMenuView;
//@property (nonatomic, strong) TabBarView *tabBarView;
//@property (nonatomic, strong) IconBtn *iconBtn;

@end



@implementation DockView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1
        [self setupBottomMenuView];
        
        // 2
        [self setupTabBarView];
        
        // 3
        [self setupIconBtn];
    }
    return self;
}

//
- (void)setupIconBtn {
    IconBtn *iconBtn = [[IconBtn alloc] init];
//    iconBtn.backgroundColor = XColor(0xff, 0xaa, 0x00);
    
    _iconBtn = iconBtn;
    [self addSubview:iconBtn];
}

//
- (void)setupTabBarView {
    TabBarView *tabBarView = [[TabBarView alloc] init];
//    tabBarView.backgroundColor = [UIColor lightGrayColor];
    tabBarView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    _tabBarView = tabBarView;
    [self addSubview:tabBarView];
}

//
- (void)setupBottomMenuView {
    BottomMenuView *bottomMenuView = [[BottomMenuView alloc] init];
//    bottomMenuView.backgroundColor = [UIColor cyanColor];
    bottomMenuView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    _bottomMenuView = bottomMenuView;
    [self addSubview:bottomMenuView];
}

- (void)rotate:(BOOL)isLandscape {
//    NSLog(@"isLandscape: %d", isLandscape);
    // 1, 设置自身
    self.xWidth = isLandscape ? kDockLandscapeW : kDockPortraintW;
    
    // 2, 设置 BottomMenuView
    [self.bottomMenuView rotate:isLandscape];
    
    // 3, 设置 TabBarView
    [self.tabBarView rotate:isLandscape];
//    self.tabBarView.xY = self.xHeight - self.bottomMenuView.xHeight - self.tabBarView.xHeight;
    
    // 4, 设置 IconBtn
    [self.iconBtn rotate:isLandscape];
}

@end


