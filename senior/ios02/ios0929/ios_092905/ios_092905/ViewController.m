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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self invocation];
    
//    [self blockOperation];
    
    [self myOperation];
    
}

//
- (void)myOperation {
    MyOperation *op = [[MyOperation alloc] init];
    [op start];
    
}


//
- (void)blockOperation {
    // 1， 封装操作 : 主线程中执行
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%s - %@", __func__, [NSThread currentThread]);
    }];
    
    // 2, 追加操作 : 子线程中执行
    for (int i = 0; i < 3; i++) {
        [op addExecutionBlock:^{
            NSLog(@"%d - %@", i, [NSThread currentThread]);
        }];
    }
    
    // 3, 启动操作
    [op start];
}

// ---
- (void)invocation {
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    
    [op start]; // 启动操作
}

- (void)download {
    NSLog(@"%s - %@", __func__, [NSThread currentThread]);
    
    
}
// ---

@end


