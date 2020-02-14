//
//  MySettingItem.h
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//typedef enum : NSInteger {
//    MySettingItemTypeArrow,
//    MySettingItemTypeSwitch
//} MySettingItemType;

@interface MySettingItem : NSObject

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *subTitle;

@property (nonatomic, strong) void(^operationBlock)(NSIndexPath *indexPath);

//@property (nonatomic, assign) MySettingItemType type; // 辅助视图

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle;

@end



