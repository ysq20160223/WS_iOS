//
//  UIImage+Image.h
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (X)

//
+ (instancetype)xImageWithOriginalImageNamed:(NSString *)imageName;

// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//
- (instancetype)xCircleImage;

//
+ (instancetype)xCircleImageNamed:(NSString *)name;


// 拉伸图片
+ (instancetype)xResizeImage:(NSString *)imageName;
- (instancetype)xResizeImage;

@end
