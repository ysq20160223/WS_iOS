//
//  ViewController.m
//  ios_092906
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyOperation.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)myOperation:(UIButton *)sender {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    for (int i = 0; i < 2; i++) {
        MyOperation *op = [[MyOperation alloc] init];
        op.name = [NSString stringWithFormat:@"operation: %d", i];
        [queue addOperation: op];
    }
}

- (IBAction)block:(UIButton *)sender {
    // 1, 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2, 封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1 - %@", [NSThread currentThread]);
    }];
    [op1 addExecutionBlock:^{
        NSLog(@"3 - %@", [NSThread currentThread]);
    }];
    
    //
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2 - %@", [NSThread currentThread]);
    }];
    
    // 3, 添加操作到队列中
    [queue addOperation:op1];
    [queue addOperation:op2];
    
//    [op1 start];
}


- (IBAction)invocation:(UIButton *)sender {
    // 1, 创建队列
    // 并发 : 全局并发队列, 自己创建(concurrent)
    // 串行 : 主队列, 自己创建(serial)
    
    // NSOperationQueue
    // 主队列 : 凡是放到主队列里面的任务都是在主线程中执行 [NSOperationQueue mainQueue]
    // 非主队列 : 同时具备了并发和串行功能, 默认是并发队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2, 封装操作
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download1) object:nil];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download2) object:nil];
    
    // 3, 添加操作到队列中
    [queue addOperation:op1];
    [queue addOperation:op2];
}

- (void)download2 {
    NSLog(@"%@", [NSThread currentThread]);
}


- (void)download1 {
    NSLog(@"%@", [NSThread currentThread]);
}

@end


