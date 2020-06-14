//
//  TabBarView.m
//  QQZone
//
//  Created by Apple on 2020/6/10.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TabBarView.h"

// category
#import "UIView+X.h"

#import "Const.h"



@interface TabBarView()

@property (nonatomic, strong) TabBarBtn *selectedTabBarBtn;

@end



@implementation TabBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupItemWithImageName:@"tab_bar_feed_icon" andTitle:@"Moments" andType:TabBarMoments];
        [self setupItemWithImageName:@"tab_bar_passive_feed_icon" andTitle:@"Passive" andType:TabBarPassive];
        [self setupItemWithImageName:@"tab_bar_pic_wall_icon" andTitle:@"Pic" andType:TabBarPic];
        [self setupItemWithImageName:@"tab_bar_e_album_icon" andTitle:@"EAlbum" andType:TabBarEAlbum];
        [self setupItemWithImageName:@"tab_bar_friend_icon" andTitle:@"Friend" andType:TabBarFriend];
        [self setupItemWithImageName:@"tab_bar_e_more_icon" andTitle:@"More" andType:TabBarMore];
    }
    return self;
}

- (void)setupItemWithImageName:(NSString *)imageName andTitle:(NSString *)title andType:(DockItemType)type {
    TabBarBtn *btn = [TabBarBtn buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag = type;
    
    [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
}

#pragma mark - Click Listener
- (void)clickItem:(TabBarBtn *)btn {
//    NSLog(@"%@; %@", self.selectedTabBarBtn, btn);
    if ([self.tabBarViewDelegate respondsToSelector:@selector(tabBarBtn:didClickFrom:toType:)]) {
        [self.tabBarViewDelegate tabBarBtn:btn didClickFrom:(int)self.selectedTabBarBtn.tag toType:(int)btn.tag];
    }
    
    // 1
    self.selectedTabBarBtn.selected = NO;
    self.selectedTabBarBtn = btn;
    self.selectedTabBarBtn.selected = YES;
    
    // 2
//    for (TabBarBtn *tabBarBtn in [self subviews]) {
//        tabBarBtn.selected = NO;
//    }
//    btn.selected = YES;
}

- (void)rotate:(BOOL)isLandscape {
//    NSLog(@"isLandscape: %d", isLandscape);
    
    // 1
    self.xWidth = self.superview.xWidth;
    self.xHeight = kTabBarViewItemWH * 6;
    self.xY = self.superview.xHeight - (isLandscape ? kBottomMenuViewLandscapeH : kBottomMenuViewPortraintH) - self.xHeight;
    
    // 2
    NSInteger count = self.subviews.count;
    for (NSInteger i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        btn.xWidth = self.xWidth;
        btn.xHeight = self.xHeight / count;
        
        btn.xY = btn.xHeight * i;
        
        if (!isLandscape) {
            btn.titleLabel.hidden = YES;
        }
    }
    
}

#pragma mark -
- (void)unselectAllType {
    self.selectedTabBarBtn.selected = NO;
}

- (void)selectType:(DockItemType)type {
    self.selectedTabBarBtn.selected = YES;
}

@end



#pragma mark -
@implementation TabBarBtn
 
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    // 1
    if (self.xWidth > self.xHeight) {
        return CGRectMake(0, 0, self.xWidth * 0.4, self.xHeight);
    } else {
        return CGRectMake(0, 0, self.xWidth, self.xHeight);
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    // 1
    if (self.xWidth > self.xHeight) {
        return CGRectMake(self.xWidth * 0.4, 0, self.xWidth * 0.6, self.xHeight);
    } else {
        return CGRectZero;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

@end


