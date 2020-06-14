//
//  BottomMenuView.m
//  QQZone
//
//  Created by Apple on 2020/6/9.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "BottomMenuView.h"

// category
#import "UIView+X.h"

#import "Const.h"

@implementation BottomMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1
        [self setupItemWithImageName:@"tabbar_mood" andType:BottomMenuMood];
        [self setupItemWithImageName:@"tabbar_photo" andType:BottomMenuPhoto];
        [self setupItemWithImageName:@"tabbar_blog" andType:BottomMenuBlog];
        
        //
    }
    return self;
}

- (void)setupItemWithImageName:(NSString *)imageName andType:(BottomMenuType)type {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    
    btn.tag = type;
    [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
}

#pragma mark - Listener
- (void)clickItem:(UIButton *)btn {
    if ([self.bottomMenuDelegate respondsToSelector:@selector(bottomMenuView:didClickBottomMenuType:)]) {
        [self.bottomMenuDelegate bottomMenuView:self didClickBottomMenuType:(int)btn.tag];
    }
}


- (void)rotate:(BOOL)isLandscape {
//    NSLog(@"isLandscape: %d", isLandscape);
    
    // 1
    self.xWidth = self.superview.xWidth;
    self.xHeight = isLandscape ? kBottomMenuViewLandscapeH : kBottomMenuViewPortraintH;
    self.xY = self.superview.xHeight - self.xHeight;
    
    // 2
    NSInteger count = self.subviews.count;
    for (NSInteger i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        btn.xWidth = isLandscape ? self.xWidth / count : self.xWidth;
        btn.xHeight = kDockPortraintW;
        
        btn.xX = isLandscape ? btn.xWidth * i : 0;
        btn.xY = isLandscape ? 0 : btn.xHeight * i;
    }
}

@end


