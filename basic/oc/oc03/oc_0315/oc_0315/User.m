//
//  User.m
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "User.h"

@implementation User

//
- (void)dealloc {
    
    NSLog(@"name: %@", _name);
    
    [_name dealloc];
    [_account dealloc];
    [_password dealloc];
    [_icon dealloc];
    [_phone dealloc];
    
    [super dealloc];
}

@end


