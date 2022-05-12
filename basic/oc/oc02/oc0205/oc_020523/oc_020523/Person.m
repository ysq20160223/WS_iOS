//
//  Person.m
//  oc_020523
//
//  Created by Apple on 2017/7/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)method {
    XLog
}

// 类被加载的时候调用
+ (void)load {
    XLog
}

// 当第一次使用该类的时候调用
+ (void)initialize {
    XLog
}


// 020526
// 实例对象输出结果
- (NSString *)description {
    return [NSString stringWithFormat:@"%@[age: %d; name: %@]", self.className, _age, _name];
}

// 类对象输出结果
+ (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.className];
}


@end


