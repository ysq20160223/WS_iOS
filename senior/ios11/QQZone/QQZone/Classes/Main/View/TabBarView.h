//
//  TabBarView.h
//  QQZone
//
//  Created by Apple on 2020/6/10.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Const.h"

NS_ASSUME_NONNULL_BEGIN

@class TabBarBtn;

#pragma mark -
@protocol TabBarViewDelegate <NSObject>

@optional
- (void)tabBarBtn:(nullable TabBarBtn *)tabBarBtn didClickFrom:(DockItemType)fromType toType:(DockItemType)toType;

@end



#pragma mark -
@interface TabBarView : UIView

@property (nonatomic, strong) id<TabBarViewDelegate> tabBarViewDelegate;

//
- (void)rotate:(BOOL)isLandscape;

//
- (void)unselectAllType;

//
- (void)clickItem:(TabBarBtn *)btn;

@end



@interface TabBarBtn : UIButton

@end

NS_ASSUME_NONNULL_END
