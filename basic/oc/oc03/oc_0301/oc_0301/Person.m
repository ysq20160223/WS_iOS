//
//  Person.m
//  oc_0301
//
//  Created by Apple on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

#import "../../../../../PrefixHeader.pch"

@implementation Person

+ (void)load {
    NSLog(@"");
}

+ (void)initialize {
    NSLog(@"");
}

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"");
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"age: %d", _age];
}

// 当一个 Person 对象被回收时, 就会自动调用这个方法
- (void)dealloc {
    NSLog(@"");
    [super dealloc]; // 一定要调用, 而且放在最后面
    
}

@end


