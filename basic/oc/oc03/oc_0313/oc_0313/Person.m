//
//  Person.m
//  oc_0313
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "../../../../../PrefixHeader.pch"

#import "Person.h"

@implementation Person

- (void)dealloc{
    [_book release];
    
    NSLog(@"");
    [super dealloc];
}

@end


