//
//  Flag.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Flag.h"

@implementation Flag

+ (instancetype)flagWithDict:(NSDictionary *)dict {
    Flag *flag = [[self alloc] init];
    
    // 01 - 常规操作
//    flag.name = dict[@"name"];
//    flag.icon = [UIImage imageNamed:dict[@"icon"]];

    // 02
    [flag setValuesForKeysWithDictionary:dict]; // KVC 原理
    
    // 03 - KVC具体实现原理 : 遍历 dictionary 中所有的 key
//    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        [flag setValue:obj forKey:key];
//    }];
    
    return flag;
}

/*
    01, 去模型中查找有没有 setIcon 方法, 如果有直接调用 : [flag setIcon:@"China.jpg"]
    02, 去模型中查找有没有 icon 属性, 如果有直接访问成员属性 icon = @"China.jpg";
    03, 去模型中查找有没有 _icon 属性, 如果有直接访问成员属性 _icon = @"China.jpg";
    04, 找不到, 抛出异常 setValue:forUndefineKey
 */
- (void)setIcon:(NSString *)icon {
    _icon = [UIImage imageNamed:icon];
}

//
//- (NSString *)description {
//    return [NSString stringWithFormat:@"Flag[name = %@, icon = %@]", _name, _icon];
//}

@end



