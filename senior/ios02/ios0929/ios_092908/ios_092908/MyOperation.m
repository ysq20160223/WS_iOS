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
    // -
    for (int i = 0; i < 5; i++) {
        NSLog(@"%d - %@", i, [NSThread currentThread]);
        [NSThread sleepForTimeInterval:.5];
    }
    
    if (self.isCancelled) {
        return;
    }
    
    // --
    for (int i = 0; i < 5; i++) {
        NSLog(@"%d -- %@", i, [NSThread currentThread]);
        [NSThread sleepForTimeInterval:.5];
    }
    
    if (self.isCancelled) {
        return;
    }
    // ---
    for (int i = 0; i < 5; i++) {
        NSLog(@"%d --- %@", i, [NSThread currentThread]);
        [NSThread sleepForTimeInterval:.5];
    }
}

@end


