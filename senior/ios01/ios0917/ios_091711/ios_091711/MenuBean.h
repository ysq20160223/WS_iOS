//
//  MenuItem.h
//  ios_091711
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuBean : NSObject

@property (strong, nonatomic) UIImage *image; // 图片

@property (strong, nonatomic) NSString *title; // 标题

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;

@end


