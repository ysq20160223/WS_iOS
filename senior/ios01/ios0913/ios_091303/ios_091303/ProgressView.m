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
    
//    [self drawRect:self.bounds]; // 系统才能调用
    
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGPoint center = CGPointMake(rect.size.width * .5, rect.size.height * .5);
    CGFloat radius = rect.size.width * .5 - 10;
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + self.progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    [path stroke];
//    [path fill];
}


@end


