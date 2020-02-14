//
//  ViewController.m
//  ios_092809
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

// 主队列示自带的一种特殊的串行队列
// 放在主队列中的任务都会放在主线程中执行

// 同步主队列 : 死锁
- (IBAction)syncMain:(UIButton *)sender {
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 同步函数
    for (int i = 0; i < 5; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"i:%d - %@", i, [NSThread currentThread]);
        });
    }
}

// 异步主队列 : 不会开线程, 任务串行执行
- (IBAction)asyncMain:(UIButton *)sender {
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 异步函数
    for (int i = 0; i < 5; i++) {
        dispatch_async(queue, ^{
            NSLog(@"i:%d - %@", i, [NSThread currentThread]);
        });
    }
}

// -----------------------------------------

// 同步串行
- (IBAction)syncSerial:(UIButton *)sender {
    // 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    // 同步函数
    for (int i = 0; i < 5; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"i:%d - %@", i, [NSThread currentThread]);
        });
    }
}

// 同步并发
- (IBAction)syncConcurrent:(UIButton *)sender {
    // 全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 同步函数
    for (int i = 0; i < 5; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"i:%d - %@", i, [NSThread currentThread]);
        });
    }
}

// 异步串行 : 开启一条线程, 任务串行执行
- (IBAction)asyncSerial:(UIButton *)sender {
    // 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    // 异步函数
    for (int i = 0; i < 5; i++) {
        dispatch_async(queue, ^{
            NSLog(@"i:%d - %@", i, [NSThread currentThread]);
        });
    }
}

// 异步并发 : 开启新的线程(开启的线程个数不确定), 并发执行
- (IBAction)asyncConcurrent:(UIButton *)sender {
    // 创建并发队列
//    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 获得全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 异步函数
    for (int i = 0; i < 5; i++) {
        dispatch_async(queue, ^{
            NSLog(@"i:%d - %@", i, [NSThread currentThread]);
        });
    }
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


@end



