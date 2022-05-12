//
//  Person.m
//  oc_020505
//
//  Created by Apple on 2017/7/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

// @synthesize(合成, 综合) : 自动生成 set/get 的实现

@implementation Person

//@synthesize age; // 为不带下划线的 age 成员变量生成 方法实现
// @synthesize age = _age;

//@synthesize height;
//@synthesize height = _height; // 可以省略



- (void)test {
    age = 1;
    _age = 10; // property
    _height = 170;
}

- (void)setHeight:(int)height {
    _height = height;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[age: %d; _age: %d; height: %d]", [self class], age, _age, _height];
}

@end


