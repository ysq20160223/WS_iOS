//
//  XSettingItem.m
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XSettingItem.h"

@implementation XSettingItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title {
    XSettingItem *item = [self.alloc init];
    item.image = image;
    item.title = title;
    return item;
}

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle {
    XSettingItem *item = [self.alloc init];
    item.image = image;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"title: %@, subTitle: %@", self.title, self.subTitle];
}

@end
