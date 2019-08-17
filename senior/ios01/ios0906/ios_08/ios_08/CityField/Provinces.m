//
//  Provinces.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Provinces.h"

@implementation Provinces

+ (instancetype)provincesWithDict:(NSDictionary *)dict {
    Provinces *p = [[Provinces alloc] init];
    [p setValuesForKeysWithDictionary:dict];
    return p;
}

@end
