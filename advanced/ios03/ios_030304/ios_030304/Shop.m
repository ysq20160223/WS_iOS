//
//  Shop.m
//  ios_030304
//
//  Created by Apple on 2017/7/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (id)initWithDict:(NSDictionary *)dict {
    if(self = [super init]) {
        self.name = dict[@"name"];
        self.desc = dict[@"desc"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (id)shopWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
