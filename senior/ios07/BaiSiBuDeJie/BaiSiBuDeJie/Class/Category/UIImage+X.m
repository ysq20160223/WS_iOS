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

@end


