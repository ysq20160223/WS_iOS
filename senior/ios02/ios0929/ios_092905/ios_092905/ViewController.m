//
//  ViewController.m
//  ios_092905
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyOperation.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)myOperation {
    [[[MyOperation alloc] init] start];
}


- (IBAction)blockOperation {
    // 1， 封装操作 : 主线程中执行
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@", [NSThread currentThread]);
    }];
    
    // 2, 追加操作 : 子线程中执行
    for (int i = 0; i < 3; i++) {
        [op addExecutionBlock:^{
            NSLog(@"i: %d; %@", i, [NSThread currentThread]);
        }];
    }
    
    // 3, 启动操作
    [op start];
}


//  [ˌɪnvəˈkeɪʃn] : 祈祷, 乞求
- (IBAction)invocationOperation {
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    [op start];
}

- (void)download {
    NSLog(@"%@", [NSThread currentThread]);
}

@end


