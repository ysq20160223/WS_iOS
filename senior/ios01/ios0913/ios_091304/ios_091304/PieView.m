//
//  PieView.m
//  ios_091304
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PieView.h"

@implementation PieView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray *precentArray = @[@25, @35, @40];
    
    CGPoint centerPoint = CGPointMake(rect.size.width *.5, rect.size.height * .5);
    CGFloat radius = rect.size.width * .5 - 10;
    
    CGFloat angle = 0;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    
    
    for (NSNumber *num in precentArray) {
        [XRandomColor() set];
        
        angle = num.integerValue / 100.0 * M_PI * 2;
        startAngle = endAngle;
        endAngle = startAngle + angle;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        [path addLineToPoint:centerPoint];
        [path fill];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

@end


