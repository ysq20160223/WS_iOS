//
//  Student.m
//  oc_0310
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)initWithNo:(int)no {
    if (self = [super init]) {
        _no = no;
    }
    return self;
}

//
- (void)setName:(NSString *)name {
    if(name != _name) {
        [_name release];
        _name = [name retain];
    }
}
- (NSString *)name {
    return _name;
}

//
- (void)setCar:(Car *)car {
    if(car != _car) {
        [_car release];
        _car = [car retain];
    }
}
- (Car *)car {
    return _car;
}

//
- (void)setDog:(Dog *)dog {
    if(dog != _dog) {
        [_dog release];
        _dog = [dog retain];
    }
}
- (Dog *)dog {
    return _dog;
}


//
- (void)dealloc {
    [_name release];
    [_car release];
    [_dog release];
    
    NSLog(@"name: %@", _name);
    [super dealloc];
}

@end
