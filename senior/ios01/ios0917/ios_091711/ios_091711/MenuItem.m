//
//  MenuItem.m
//  ios_091711
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image {
    MenuItem *item = [[self alloc] init];
    item.title = title;
    item.image = image;
    return item;
}

@end
