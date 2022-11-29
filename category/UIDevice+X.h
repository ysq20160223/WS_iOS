//
//  UIDevice+X.h
//  Media
//
//  Created by Apple on 2022/11/29.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (X)


/// 底部安全区高度
+ (CGFloat)safeDistanceBottom;

/// 底部导航栏高度
+ (CGFloat)tabBarHeight;

/// 底部导航栏高度（包括安全区）
+ (CGFloat)tabBarFullHeight;

@end

NS_ASSUME_NONNULL_END
