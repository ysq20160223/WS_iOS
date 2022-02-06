//
//  Person.m
//  oc_0316
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"
#import "IDCard.h"

#import "../../../../../PrefixHeader.pch"


@implementation Person

- (void)dealloc {
    [_card release];
    
    NSLog();
    [super dealloc];
}

@end


