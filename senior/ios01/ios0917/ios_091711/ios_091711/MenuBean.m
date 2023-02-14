//
//  MenuItem.m
//  ios_091711
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MenuBean.h"

@implementation MenuBean

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image {
    MenuBean *item = [[self alloc] init];
    item.title = title;
    item.image = image;
    return item;
}

@end


