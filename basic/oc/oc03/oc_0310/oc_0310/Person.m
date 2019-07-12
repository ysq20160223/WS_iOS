//
//  Person.m
//  oc_0310
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setCar:(Car *)car {
    if(_car != car) {
        [_car release]; // 将旧车 release
        
        _car = [car retain];
    }
}
- (Car *)car {
    return _car;
}


- (void)setAge:(int)age {
    _age = age;
}
- (int)age {
    return _age;
}


- (void)dealloc {
    
    [_car release];
    
    NSLog(@"age: %d", _age);
    [super dealloc];
}

@end



