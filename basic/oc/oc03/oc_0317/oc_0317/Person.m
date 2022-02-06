//
//  Person.m
//  oc_0317
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

#import "../../../../../PrefixHeader.pch"

@implementation Person


- (id)initWithAge:(int)age {
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

- (void)dealloc {
    NSLog();
    [super dealloc];
}

@end


