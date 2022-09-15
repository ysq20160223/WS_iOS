//
//  UIImageView+X.m
//
//  Created by Apple on 2020/5/7.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UIImageView+X.h"


@implementation UIImageView (X)


- (void)xRect:(NSString *)url placeholder:(NSString *)placeholder completed:(SDExternalCompletionBlock)completedBlock {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder] completed:completedBlock];
}

- (void)xRect:(NSString *)url placeholder:(NSString *)placeholder {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder]];
}

- (void)xCircle:(NSString *)url placeholder:(NSString *)placeholder {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage xCircleImageNamed:placeholder] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = [image xCircleImage];
    }];
}

- (UIImage *)drawVerticalLineOfDashByImageView {
    CGFloat ivW = self.frame.size.width;
    CGFloat ivH = self.frame.size.height;
    // 开始划线 划线的frame
    UIGraphicsBeginImageContext(self.frame.size);

    [self.image drawInRect:CGRectMake(0, 0, ivW, ivH)];

    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();

    // 设置线条终点的形状
    CGContextSetLineCap(context, kCGLineCapRound);
    // 设置虚线的长度 和 间距
    CGFloat lengths[] = {3, 3};

   
    CGContextSetStrokeColorWithColor(context, XColor(0xe0, 0xe0, 0xe0).CGColor);
    // 开始绘制虚线
    CGContextSetLineDash(context, 0, lengths, 1);
//    CGContextSetLineWidth(context, 3);

    CGContextMoveToPoint(context, ivW * 0.5, 0);
    CGContextAddLineToPoint(context, ivW * 0.5, ivH);

    CGContextStrokePath(context);

    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}

- (UIImage *)drawHorizontalLineOfDashByImageView {
    CGFloat ivW = self.frame.size.width;
    CGFloat ivH = self.frame.size.height;
    // 开始划线 划线的frame
    UIGraphicsBeginImageContext(self.frame.size);

    [self.image drawInRect:CGRectMake(0, 0, ivW, ivH)];

    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();

    // 设置线条终点的形状
    CGContextSetLineCap(context, kCGLineCapRound);
    // 设置虚线的长度 和 间距
    CGFloat lengths[] = {3, 3};

   
    CGContextSetStrokeColorWithColor(context, XColor(0xe0, 0xe0, 0xe0).CGColor);
    // 开始绘制虚线
    CGContextSetLineDash(context, 0, lengths, 1);
//    CGContextSetLineWidth(context, 3);

    CGContextMoveToPoint(context, 0, ivH * 0.5);
    CGContextAddLineToPoint(context, ivW, ivH * 0.5);

    CGContextStrokePath(context);

    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}

@end


