//
//  UIImage+X.m
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIImage+X.h"

@implementation UIImage (X)


+ (instancetype)xImageWithOriginalImageNamed:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (UIImage *)xImageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    // 渲染上下文
    CGContextFillRect(context, rect);
    
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)xImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//
- (instancetype)xCircleImage {
    // 1
    UIGraphicsBeginImageContext(self.size);
    
    // 2
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 4
    CGContextClip(ctx);
    
    // 5
    [self drawInRect:rect];
    
    // 6
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 7
    UIGraphicsEndImageContext();
    
    return image;
}

//
+ (instancetype)xCircleImageNamed:(NSString *)name {
    return [[self imageNamed:name] xCircleImage];
}


// 拉伸图片
+ (instancetype)xResizeImage:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] xResizeImage];
}

- (instancetype)xResizeImage {
    CGFloat w = self.size.width * 0.5;
    CGFloat h = self.size.height * 0.5;
    return [self stretchableImageWithLeftCapWidth:w topCapHeight:h];
}


+ (UIImage *)xImageNamed:(NSString *)name withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)boardColor {
    return [self xImage:[UIImage imageNamed:name] withBorderWidth:borderWidth withBorderColor:boardColor];
}

+ (UIImage *)xImage:(UIImage *)image withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)boardColor {
    // 1, 加载图片
//    UIImage *image = [UIImage imageNamed:@"aLi.png"];
    
    // 2, 边框宽度
//    CGFloat borderW = 10;
    
    // 3, 开启图片上下文
    CGSize size = CGSizeMake(image.size.width + 2 * borderWidth, image.size.height + 2 * borderWidth);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 4, 先描述一个大圈, 设为填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
//    [[UIColor cyanColor] set]; // 设置边框的颜色
    [boardColor set];
    
    [path fill];
    
    // 5, 再添加一个小圈, 把小圈设为裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, image.size.width, image.size.height)];
    [path addClip];
    
    // 6, 把图片给绘制到上下文
    [image drawInRect:CGRectMake(borderWidth, borderWidth, image.size.width, image.size.height)];
    
    // 7, 生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8, 关闭上下文
    UIGraphicsEndImageContext();
    
//    self.imageView.image = newImage;
    
    return newImage;
}

@end


