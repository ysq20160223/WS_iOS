//
//  MyThread.m
//  ios_092805
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Thread.h"


@implementation Thread

- (void)dealloc {
    NSLog(@"name: %@", [Thread currentThread]);
}

@end


