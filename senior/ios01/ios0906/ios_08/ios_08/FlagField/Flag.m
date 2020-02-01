//
//  Flag.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Flag.h"

@implementation Flag


+ (instancetype)flagWithDictionary:(NSDictionary *)dic {
    Flag *flag = [[self alloc] init];
    
    // 01 - 常规操作
//    flag.name = dict[@"name"];
//    flag.icon = [UIImage imageNamed:dict[@"icon"]];

    // 02
    [flag setValuesForKeysWithDictionary:dic]; // KVC
    
    // 03 - KVC具体实现原理:
//    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSLog(@"%@: %@", key, obj);
//        [flag setValue:obj forKey:key];
//    }];
    
    return flag;
}

/*
    01, 去模型中查找有没有 setCountryIcon 方法, 如果有直接调用 : [flag setCountryIcon:@"China.jpg"]
    02, 去模型中查找有没有 countryIcon 属性, 如果有直接访问成员属性 countryIcon = @"China.jpg";
    03, 去模型中查找有没有 _countryIcon 属性, 如果有直接访问成员属性 _countryIcon = @"China.jpg";
    04, 找不到, 抛出异常 setValue:forUndefineKey
 */
- (void)setCountryIcon:(NSString *)icon {
    _countryIcon = [UIImage imageNamed:icon];
}


- (NSString *)description {
    return [NSString stringWithFormat:@"Flag: %@, %@", self.countryName, self.countryIcon];
}

@end



