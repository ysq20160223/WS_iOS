//
//  CAGradientLayer+X.h
//  Nxin
//
//  Created by Apple on 2020/10/2.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAGradientLayer (X)

+ (void)addCAGradientLayer:(UIView *)view andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor andStartPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
