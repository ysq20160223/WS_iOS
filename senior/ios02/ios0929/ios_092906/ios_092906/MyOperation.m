//
//  MyOperation.m
//  ios_092906
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation

- (void)main {
    for (int i = 0; i < 5; i++) {
        NSLog(@"%@, i: %d, %@", self.name, i, [NSThread currentThread]);
    }
}

@end
