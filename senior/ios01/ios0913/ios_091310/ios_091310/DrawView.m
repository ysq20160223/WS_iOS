//
//  DrawView.m
//  ios_091310
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DrawView.h"

@interface DrawView() {
    NSInteger viewW;
    NSInteger viewH;
}

@end



@implementation DrawView

- (void)awakeFromNib {
    [super awakeFromNib];
    viewW = self.frame.size.width;
    viewH = self.frame.size.height;
    NSLog(@"viewW: %ld; viewH: %ld", viewW, viewH);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        XLog
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext(); // 1
    UIBezierPath *path = UIBezierPath.bezierPath; // 2
    
    [path moveToPoint:CGPointMake(viewW * .1, viewH * .5)];
    [path addLineToPoint:CGPointMake(viewW * .9, viewH * .5)];
    
    //
    [UIColor.blueColor set];
    CGContextSetLineWidth(ctx, 2);
    CGContextSaveGState(ctx); // 把当前的状态保存到图片上下文状态栈中
    
    //
    [UIColor.redColor set];
    CGContextSetLineWidth(ctx, 5);
    
    CGContextAddPath(ctx, path.CGPath); // 3
    CGContextStrokePath(ctx); // 4
    
    
    //
    path = UIBezierPath.bezierPath; // 2
    
    [path moveToPoint:CGPointMake(viewW * .5, viewH * .1)];
    [path addLineToPoint:CGPointMake(viewW * .5,  viewH * .9)];
    
    CGContextRestoreGState(ctx); // 恢复上下文状态栈
    CGContextAddPath(ctx, path.CGPath); // 3
    CGContextStrokePath(ctx); // 4
}

@end


