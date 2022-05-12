//
//  Person.m
//  oc_020501
//
//  Created by Apple on 2017/7/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

//#import "../../../../../PrefixHeader.pch"

@implementation Person

- (void)setAge:(int)age {
    XLog
    _age = age;
}

- (int)age {
    XLog
    return _age;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[age: %d]", [self class], self.age];
}

@end


