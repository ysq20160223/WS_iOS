//
//  Person.m
//  oc_020523
//
//  Created by sq y on 2017/7/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)method {
    NSLog(@"class method");
}

// 类被加载的时候调用
+ (void) load {
    NSLog(@"Person load");
}

// 当第一次使用该类的时候调用
+ (void) initialize {
    NSLog(@"Person initialize");
}


// 020526
// 实例对象输出结果
- (NSString *)description {
    return [NSString stringWithFormat: @"Person[age: %d, name: %@]", _age, _name];
}

// 类对象输出结果
+ (NSString *)description {
    return [NSString stringWithFormat:@"Person ->"];
}


@end
