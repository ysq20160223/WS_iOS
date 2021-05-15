//
//  UIImage+Image.m
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIImage+X.h"

@implementation UIImage (X)


+ (instancetype)xImageWithOriginalImageNamed:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (UIImage *)imageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    // 渲染上下文
    CGContextFillRect(context, rect);
    
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
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

@end


