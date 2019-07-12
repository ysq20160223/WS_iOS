//
//  Province.m
//  ios_03020108
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (id)provinceWithHeader:(NSString *)header footer:(NSString *)footer cities:(NSArray *)cities {
    Province *p = [[Province alloc] init];
    p.header = header;
    p.footer = footer;
    p.cities = cities;
    return p;
}

@end
