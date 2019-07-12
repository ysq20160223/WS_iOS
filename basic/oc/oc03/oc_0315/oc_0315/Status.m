//
//  Status.m
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Status.h"

@implementation Status


- (void)dealloc {

    NSLog(@"text: %@", _text);
    
    [_text dealloc];
    [_icon dealloc];
    [_user dealloc];
    [_retweenStatus dealloc];
    
    [super dealloc];
}

@end
