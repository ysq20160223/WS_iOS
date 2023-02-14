//
//  Distance.m
//  ios_091708
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Distance.h"

@implementation Distance

+ (CGFloat)distanceWithCircleA:(UIView *)aView andCircleB:(UIView *)bView {
    CGFloat offsetX = aView.center.x - bView.center.x;
    CGFloat offsetY = aView.center.y - bView.center.y;
    return sqrtf(offsetX * offsetX + offsetY * offsetY);
}

@end


