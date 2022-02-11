//
//  Person.m
//  ios_04
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

@implementation Person

static Person *_instance = nil;

// 类加载进内存
+ (void)load {
    NSLog();
    _instance = [[self alloc] init];
}

+ (void)initialize {
    NSLog();
}

+ (instancetype)sharePerson {
    return _instance;
}


+ (instancetype)alloc {
    // 外界调用直接抛异常
    // NSInternalInconsistencyException', reason: 'There can only be one UIApplication instance.'
    if(_instance) {
        NSException *excp = [NSException exceptionWithName:@"NSInternalInconsistencyException" reason:@"There can only be one Person instance." userInfo:nil];
        [excp raise];
    }
    
    return [super alloc];
}

@end


