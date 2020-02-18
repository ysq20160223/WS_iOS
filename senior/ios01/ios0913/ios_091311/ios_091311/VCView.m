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
    
    UIBezierPath *path = [UIBezierPath bezierPath]; // 2
    [path moveToPoint:CGPointMake(rect.size.width * 0.5, 0)];
    [path addLineToPoint:CGPointMake(rect.size.width * 0.5, rect.size.height)];
    
    [path moveToPoint:CGPointMake(0, rect.size.height * 0.5)];
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height * 0.5)];
    CGContextAddPath(ctx, path.CGPath); // 3
    CGContextStrokePath(ctx); // 4
    
    //
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)]; // 2
    
    [[UIColor redColor] set];
    
    // 上下文矩阵操作, 必须得要在添加路径之前做操作
    CGContextTranslateCTM(ctx, rect.size.width * 0.5, rect.size.height * 0.5); // 平移
    CGContextScaleCTM(ctx, .5, .5); // 缩放
    CGContextRotateCTM(ctx, M_PI_2); // 旋转
    
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextFillPath(ctx);
}


@end


