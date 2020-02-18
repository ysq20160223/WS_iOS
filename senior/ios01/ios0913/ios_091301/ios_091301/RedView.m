//
//  RedView.m
//  ios_091301
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RedView.h"

@interface RedView() {
    NSInteger viewW;
    NSInteger viewH;
}

@end



@implementation RedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"");
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"");
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


// 作用 : 专门用绘图
// 什么时候调用 : 在 view 显示的时候调用
// rect : 当前 view 的 bounds

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSLog(@"%@", NSStringFromCGRect(rect));
    viewW = rect.size.width;
    viewH = rect.size.height;
    
    [self drawLine];
    
    [self drawQuadCurve];
    
    [self drawRect];
    
    [self drawRoundRect];
    
    [self drawArc];
}

- (void)drawArc {
    CGPoint center = CGPointMake(viewW * 3 / 4, viewH * 3 / 4);
    CGFloat radius = viewW / 4 - 10;
    CGFloat startA = 0;
    CGFloat endA = M_PI_2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    [path addLineToPoint:center]; //
    [path closePath]; // 关闭路径
    
    [[UIColor cyanColor] set];
    
//    [path fill]; // 会自动关闭路径
    [path stroke];
}

- (void)drawRoundRect {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(viewW / 8, viewH * 5 / 8, viewW / 4, viewH / 4) cornerRadius:20];
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(viewW / 8, viewH * 5 / 8, viewW / 4, viewH / 4)];

    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 0.5, 1, 1);
    CGContextSetRGBFillColor(UIGraphicsGetCurrentContext(), 1, 0, 1, 1);
//    [[UIColor cyanColor] set];
    
//    [path stroke];
//    [path fill];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddPath(ctx, path.CGPath);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

- (void)drawRect {
    // 1, 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2, 描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(viewW * 5 / 8, viewH / 8, viewW / 4, viewH / 4)];
    
    // 3, 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 设置颜色
    [[UIColor cyanColor] set];
    
    // 4, 把上下文的内容显示出来
    //    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}


// 091302 - 绘制贝塞尔曲线
- (void)drawQuadCurve {
    // 1, 获取跟 view 相关的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2, 描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.1, 设置起点
    [path moveToPoint:CGPointMake(0, viewH / 2)];
    [path addQuadCurveToPoint:CGPointMake(viewW / 2, viewH / 2) controlPoint:CGPointMake(viewW / 4, 0)];
    
    // 3, 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextSetLineWidth(ctx, 1);
    
    // 4, 把上下文的内容显示出来
    CGContextStrokePath(ctx);
}


// 091301 - 绘制坐标系
- (void)drawLine {
    // 1, 取得一个跟 view 相关的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2, 描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.1 设置起点
    [path moveToPoint:CGPointMake(0, viewH / 2)];
    
    // 2.2 添加一根线到某个点
    [path addLineToPoint:CGPointMake(viewW, viewH / 2)];
    
    // 一个路径上面可以画多条线
    [path moveToPoint:CGPointMake(viewW / 2, 0)];
    [path addLineToPoint:CGPointMake(viewW / 2, viewH)];
    
    
    CGContextSetLineWidth(ctx, 1); // 设置线的宽度
    CGContextSetLineJoin(ctx, kCGLineJoinBevel); // 设置线的连接样式
    CGContextSetLineCap(ctx, kCGLineCapRound); // 设置顶角的样式
    [[UIColor cyanColor] setStroke]; // 设置线的颜色
    
    // 3 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4 把上下文的内容显示view fill stoke
    CGContextStrokePath(ctx);
}


@end


