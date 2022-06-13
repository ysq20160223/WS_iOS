//
//  Person.m
//  Foundation_11
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"


@implementation Person

+ (void)load {
    XLog
}

+ (void)initialize {
    XLog
}

+ (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.className];
}


- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[name: %@]", self.className, _name];
}

@end


