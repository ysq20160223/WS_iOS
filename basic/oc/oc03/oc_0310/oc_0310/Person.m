//
//  Person.m
//  oc_0310
//
//  Created by Apple on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person


- (id)initWithAge:(NSInteger)age {
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

- (void)setCar:(Car *)car {
    if(_car != car) {
        [_car release]; // 将旧车 release
        
        _car = [car retain];
    }
}
- (Car *)car {
    return _car;
}


- (void)dealloc {
    [_car release];
    
    NSLog(@"age: %ld", _age);
    [super dealloc];
}

@end


