//
//  UIBezierPath+X.m
//  Nxin
//
//  Created by Apple on 2020/10/2.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UIBezierPath+X.h"

@implementation UIBezierPath (X)

+ (void)addShapeLayer:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:cornerRadii];

    CAShapeLayer *maskLayer = [CAShapeLayer.alloc init];
    maskLayer.frame = view.bounds;
    maskLayer.path = bezierPath.CGPath;
    view.layer.mask = maskLayer;
}

@end
