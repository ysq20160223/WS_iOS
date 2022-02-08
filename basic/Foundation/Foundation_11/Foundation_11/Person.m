//
//  Person.m
//  Foundation_11
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

#import "../../../../PrefixHeader.pch"

@implementation Person

+ (void)load {
    NSLog();
}

+ (void)initialize {
    NSLog();
}

+ (NSString *)description {
    return [NSString stringWithFormat:@"Person"];
}


- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Person[name: %@]", _name];
}

@end


