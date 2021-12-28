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

// @synthesize age = _age; // 可以省略
@synthesize age; // 为不带下划线的 age 成员变量生成 方法实现

// @synthesize height = _height; // 可以省略

// @synthesize age = _age, height = _height; // 可以省略


- (void)test {
    _age = 10; // property
}

@end


