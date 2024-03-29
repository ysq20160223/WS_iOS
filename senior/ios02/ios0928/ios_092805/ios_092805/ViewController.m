//
//  ViewController.m
//  ios_092805
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "Thread.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)btnClick:(UIButton *)sender {
//    NSLog(@"%@", [NSThread currentThread]);
    
//    [self createThreadMethod1];
    
    [self createThreadMethod2];
    
//    [self createThreadMethod3];
}

// 创建线程的方式3
- (void)createThreadMethod3 {
    [self performSelectorInBackground:@selector(run:) withObject:@"background thread"];
}

// 创建线程的方式2 - 默认开启线程
- (void)createThreadMethod2 {
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"default start"];
}

// 创建线程的方式1
- (void)createThreadMethod1 {
    for (int i = 0; i < 3; i++) {
        Thread *thread = [[Thread alloc] initWithTarget:self selector:@selector(run:) object:nil];
        thread.name = [NSString stringWithFormat:@"Thread-%d", i];
        
        if (i == 0) {
            [thread setThreadPriority:1];
        }
        
        if (i == 1) {
            [thread setThreadPriority:0.1];
        }
        
        if (i == 2) {
            [thread setThreadPriority:0.5];
        }
        
        [thread start];
    }
}

- (void)run:(NSString *)str {
//    NSLog(@"run - %@" , [NSThread currentThread]);
    
    for (int i = 0; i < 200; i++) {
        NSLog(@"%d, %@, %@", i, [NSThread currentThread], str);
    }
}

@end


