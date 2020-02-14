//
//  Distance.m
//  ios_091708
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Distance.h"

@implementation Distance

+ (CGFloat)distanceWithCircleA:(UIView *)a andCircleB:(UIView *)b {
    CGFloat offsetX = a.center.x - b.center.x;
    CGFloat offsetY = a.center.y - b.center.y;
    return sqrtf(offsetX * offsetX + offsetY * offsetY);
}


@end
