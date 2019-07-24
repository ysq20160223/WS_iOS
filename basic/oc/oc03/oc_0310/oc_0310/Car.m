//
//  Car.m
//  oc_0310
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Car.h"

@implementation Car

- (id)initWithSpeed:(NSInteger)speed {
    if(self = [super init]) {
        _speed = speed;
    }
    return self;
}

- (void)dealloc {
    
    /*
        _speed : 直接访问成员变量
        self->_speed : 直接访问成员变量
        self.speed : get
        [self speed] : get
     */
    
    NSLog(@"speed: %d", _speed);
    [super dealloc];
}

@end


