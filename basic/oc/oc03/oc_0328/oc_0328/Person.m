//
//  Person.m
//  oc_0328
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "../../../../../PrefixHeader.pch"

#import "Person.h"

@implementation Person

- (void)dealloc {
    NSLog();
    
    [_dog release];
    
    [super dealloc];
}

@end


