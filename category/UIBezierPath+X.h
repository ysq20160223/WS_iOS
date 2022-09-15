//
//  UIBezierPath+X.h
//
//  Created by Apple on 2020/10/2.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (X)

+ (void)addShapeLayer:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

@end

NS_ASSUME_NONNULL_END
