//
//  UIDevice+X.m
//  Media
//
//  Created by Apple on 2022/11/29.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "UIDevice+X.h"

@implementation UIDevice (X)

/// 底部安全区高度
+ (CGFloat)safeDistanceBottom {
    if (@available(iOS 13.0, *)) {
        NSSet *set = UIApplication.sharedApplication.connectedScenes;
        UIWindowScene *windowScene = [set anyObject];
        UIWindow *window = windowScene.windows.firstObject;
        return window.safeAreaInsets.bottom;
    } else if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.windows.firstObject.safeAreaInsets.bottom;
    }
    return 0;
}

/// 底部导航栏高度
+ (CGFloat)tabBarHeight {
    return 49.0f;
}

/// 底部导航栏高度（包括安全区）
+ (CGFloat)tabBarFullHeight {
    return [UIDevice tabBarHeight] + [UIDevice safeDistanceBottom];
}


@end


