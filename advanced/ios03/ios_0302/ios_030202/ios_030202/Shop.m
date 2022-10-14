//
//  Shop.m
//  ios_030202
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+ (id)shopWithName:(NSString *)name icon:(NSString *)icon desc:(NSString *)desc {
    Shop *shop = [[Shop alloc] init];
    
    shop.name = name;
    shop.icon = icon;
    shop.desc = desc;
    
    return shop;
}

@end
