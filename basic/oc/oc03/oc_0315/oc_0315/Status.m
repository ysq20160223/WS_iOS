//
//  Status.m
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "../../../../../PrefixHeader.pch"

#import "Status.h"

@implementation Status


- (void)dealloc {
    NSLog(@"_content: %@", _content);
    
    [_content release];
    [_user release];
    [_retweenStatus release];
    
    [super dealloc];
}

@end


