//
//  MyTabBar.h
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBar;

@protocol MyTabBarDelegate <NSObject>

@optional
- (void)tabBar:(MyTabBar *)tabBar didClickBtn:(NSInteger)btnIndex;

@end



@interface MyTabBar : UIView

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) id<MyTabBarDelegate> delegate;

@end
