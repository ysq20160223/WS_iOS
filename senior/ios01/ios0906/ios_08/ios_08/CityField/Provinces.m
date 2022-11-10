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
    Provinces *provinces = Provinces.alloc.init;
    [provinces setValuesForKeysWithDictionary:dict];
    return provinces;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@; cities: %@", self.name, self.cities];
}

@end


