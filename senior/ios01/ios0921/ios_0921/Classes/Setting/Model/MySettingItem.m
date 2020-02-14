//
//  MySettingItem.m
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MySettingItem.h"

@implementation MySettingItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title {
    MySettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle {
    MySettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}



@end
