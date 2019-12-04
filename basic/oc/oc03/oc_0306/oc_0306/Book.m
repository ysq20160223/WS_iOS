//
//  Book.m
//  oc_0306
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Book.h"

#import "../../../../../PrefixHeader.pch"

@implementation Book

- (void)setPrice:(int)price {
    _price = price;
}

- (int)price {
    return _price;
}

- (void)dealloc {
    
    NSLog(@"");
    
    [super dealloc];
}

@end
