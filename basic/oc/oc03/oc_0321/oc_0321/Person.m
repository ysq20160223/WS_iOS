//
//  Person.m
//  oc_0321
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

//#import "../../../../../PrefixHeader.pch"


@implementation Person

+ (id)person {
    return [[self.alloc init] autorelease];
}

+ (id)personWithAge:(int)age {
    // Person *person = [[[self alloc] init] autorelease];
    Person *person = [self person];
    person.age = age;
    return person;
}

- (void)dealloc {
    NSLog(@"age: %d", _age);
    [super dealloc];
}

@end


