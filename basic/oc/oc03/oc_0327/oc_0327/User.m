//
//  User.m
//  oc_0327
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

//#import "../../../../../PrefixHeader.pch"

#import "User.h"

@implementation User

//
- (void)dealloc {
    NSLog(@"name: %@", _name);
//    [super dealloc]; // ARC forbids explicit message send of 'dealloc'
}

@end


