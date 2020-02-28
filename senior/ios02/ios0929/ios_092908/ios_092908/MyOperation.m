//
//  MyOperation.m
//  ios_092908
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation

- (void)main {
    for (int i = 0; i < 5; i++) {
        NSLog(@"i: %d, %@", i, [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    }
    
    if (self.isCancelled) {
        return;
    }
    
    for (int j = 0; j < 5; j++) {
        NSLog(@"j: %d, %@", j, [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    }
    
    if (self.isCancelled) {
        return;
    }

    for (int k = 0; k < 5; k++) {
        NSLog(@"k: %d, %@", k, [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    }
}

@end


