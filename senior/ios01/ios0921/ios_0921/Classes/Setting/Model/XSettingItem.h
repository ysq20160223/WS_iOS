//
//  XSettingItem.h
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//typedef enum : NSInteger {
//    XSettingItemTypeArrow,
//    XSettingItemTypeSwitch
//} XSettingItemType;

@interface XSettingItem : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;

@property (nonatomic, strong) void(^operationBlock)(NSIndexPath *indexPath);


+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle;

@end


