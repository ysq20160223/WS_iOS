//
//  MyOperation.m
//  ios_100801
//
//  Created by Apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation

- (void)start {
    NSLog(@"%s - before", __func__);
    [super start];
    NSLog(@"%s - end", __func__);
}

- (void)main {
    NSLog(@"%s - before", __func__);
    [super main];
    NSLog(@"%s - end", __func__);
}


@end




