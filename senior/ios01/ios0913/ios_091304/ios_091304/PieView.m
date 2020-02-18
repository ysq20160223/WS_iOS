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
    
    CGPoint center = CGPointMake(rect.size.width *.5, rect.size.height * .5);
    CGFloat radius = rect.size.width * .5 - 10;
    
    CGFloat angle = 0;
    CGFloat startA = 0;
    CGFloat endA = 0;
    
    for (NSNumber *num in precentArray) {
        angle = num.integerValue / 100.0 * M_PI * 2;
        
        startA = endA;
        endA = startA + angle;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self randColor] set];
        [path fill];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

-(UIColor *)randColor {
    CGFloat r = arc4random_uniform(255) / 255.0;
    CGFloat g = arc4random_uniform(255) / 255.0;
    CGFloat b = arc4random_uniform(255) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end


