//
//  VCView.m
//  ios_091311
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VCView.h"

@implementation VCView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext(); // 1
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)]; // 2
    
    [[UIColor redColor] set];
    
    CGContextTranslateCTM(ctx, 100, 50); // 上下文矩阵操作, 必须得要在添加路径之前做操作
    CGContextScaleCTM(ctx, .5, .5);
    CGContextRotateCTM(ctx, M_PI_2);
    
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextFillPath(ctx);

}


@end


