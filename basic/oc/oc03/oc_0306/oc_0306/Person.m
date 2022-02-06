//
//  Person.m
//  oc_0306
//
//  Created by Apple on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

#import "../../../../../PrefixHeader.pch"

@implementation Person

- (void)setBook:(Book *)book {
    _book = [book retain];
}

- (Book *)book {
    return _book;
}

-(void)dealloc {
    
    [_book release]; // 
    
    NSLog(@"Person dealloc");
    [super dealloc];
}

@end
