//
//  ViewController.m
//  ios_092909
//
//  Created by Apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)start:(UIButton *)sender {
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op1 - %@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op2 - %@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"op3 - %@", [NSThread currentThread]);
    }];
    
    // 监听
    op1.completionBlock = ^{
        NSLog(@"op1 completion, %@", [NSThread currentThread]);
    };
    
    // 依赖 - 注意死循环
    [op1 addDependency:op3];
    [op1 addDependency:op2]; // op1 在 op2 和 op3 之后执行
    
    // 3
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
}

@end


