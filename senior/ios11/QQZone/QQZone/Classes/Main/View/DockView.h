//
//  DockView.h
//  QQZone
//
//  Created by Apple on 2020/6/8.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BottomMenuView, TabBarView, IconBtn;

@interface DockView : UIView

@property (nonatomic, weak, readonly) BottomMenuView *bottomMenuView;
@property (nonatomic, weak, readonly) TabBarView *tabBarView;
@property (nonatomic, weak, readonly) IconBtn *iconBtn;

//

- (void)rotate:(BOOL)isLandscape;

@end

NS_ASSUME_NONNULL_END
