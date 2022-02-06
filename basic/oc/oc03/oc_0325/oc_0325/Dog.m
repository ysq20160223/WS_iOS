//
//  Dog.m
//  oc_0325
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Dog.h"

#import "../../../../../PrefixHeader.pch"


@implementation Dog

- (id)initWithAge:(int)age {
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"age: %d", _age);
//    [super dealloc];
}

@end


