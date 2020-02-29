//
//  ViewController.m
//  ios_100801
//
//  Created by Apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyOperation.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)operationQueue {
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2
    MyOperation *op = [MyOperation blockOperationWithBlock:^{
        NSLog(@"%@", [NSThread currentThread]);
    }];
    
    // 3
    [queue addOperation:op];
}

- (IBAction)gcdFun {
    dispatch_queue_t queue = dispatch_queue_create("com.100801", DISPATCH_QUEUE_CONCURRENT);
    
    // 1
    dispatch_async(queue, ^{
        NSLog(@"async, %@", [NSThread currentThread]);
    });
    
    // 2, 和1等价
    dispatch_async_f(queue, NULL, func);
    //    dispatch_release(queue); // 6.0后 ARC 管理
}

void func(void *param) {
    NSLog(@"func - %@", [NSThread currentThread]);
}

@end


