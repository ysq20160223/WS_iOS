//
//  MyTabBar.h
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XTabBar;

@protocol XTabBarDelegate <NSObject>

@optional
- (void)tabBar:(XTabBar *)tabBar didClickBtn:(NSInteger)btnIndex;

@end



@interface XTabBar : UIView

@property (nonatomic, strong) NSArray *tabBarItems;

@property (nonatomic, strong) id<XTabBarDelegate> delegate;

@end
