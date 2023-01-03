//
//  ProgressView.m
//  ios_091303
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ProgressView.h"


@implementation ProgressView

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    // 系统才能调用 （如果手动调用, 系统不会创建和View相关的上下文）
//    [self drawRect:self.bounds];
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self ring:rect];
    
//    [self arc:rect];
}

- (void)ring:(CGRect)rect {
    [UIColor.cyanColor set];
    
    CGPoint centerPoint = CGPointMake(rect.size.width * .5, rect.size.height * .5);
    CGFloat radius = rect.size.width * .5 - 10;
    CGFloat startAngle = 0;
    CGFloat endAngle = startAngle + self.progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addLineToPoint:centerPoint]; //
    [path closePath];
    [path fill];
}

- (void)arc:(CGRect)rect {
    [UIColor.magentaColor set];
    
    CGPoint centerPoint = CGPointMake(rect.size.width * .5, rect.size.height * .5);
    CGFloat radius = rect.size.width * .5 - 10;
    CGFloat startAngle = 0;
    CGFloat endAngle = startAngle + self.progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path setLineWidth:9];
    [path stroke];
}


@end


