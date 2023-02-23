//
//  UIImage+X.h
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (X)

//
+ (instancetype)xImageWithOriginalImageNamed:(NSString *)imageName;

// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)xImageWithColor:(UIColor *)color;

+ (UIImage *)xImageWithColor:(UIColor *)color size:(CGSize)size;

//
- (instancetype)xCircleImage;

//
+ (instancetype)xCircleImageNamed:(NSString *)name;


// 拉伸图片
+ (instancetype)xResizeImage:(NSString *)imageName;
- (instancetype)xResizeImage;


+ (UIImage *)xImageNamed:(NSString *)name withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)boardColor;
+ (UIImage *)xImage:(UIImage *)image withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)boardColor;

@end
