//
//  CAGradientLayer+X.m
//  Nxin
//
//  Created by Apple on 2020/10/2.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "CAGradientLayer+X.h"

@implementation CAGradientLayer (X)

+ (void)addCAGradientLayer:(UIView *)view andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor andStartPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = view.frame;
    [view.layer addSublayer:gradientLayer];
}

@end


