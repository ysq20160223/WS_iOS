//
//  Person.m
//  oc_020411
//
//  Created by sq y on 2017/7/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age {
    _age = age;
}
- (int)age {
    return _age;
}

#pragma mark -

- (void)setName:(NSString *)name {
    _name = name;
}
- (NSString *)name {
    return _name;
}

@end
