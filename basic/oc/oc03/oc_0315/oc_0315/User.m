//
//  User.m
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "../../../../../PrefixHeader.pch"

#import "User.h"

@implementation User

//
- (void)dealloc {
    NSLog(@"_userName: %@", _userName);
    
    [_userName release];
    [_headPortrait release];
    
    [super dealloc];
}

@end


