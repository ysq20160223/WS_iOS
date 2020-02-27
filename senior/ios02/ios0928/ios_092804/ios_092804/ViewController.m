//
//  ViewController.m
//  ios_092804
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <pthread.h>

@interface ViewController ()

@end



@implementation ViewController

//
void *run(void *param) {
    for (NSInteger i = 0; i < 100000; i++) {
        NSLog(@"i: %zd, %@", i, [NSThread currentThread]);
    }
    return NULL;
}

- (void)second {
    for (int i = 0; i < 2; i++) {
        pthread_t thread;
        pthread_create(&thread, NULL, run, NULL); // 开启线程
    }
}

- (IBAction)btnClick:(UIButton *)sender {
    
//    [self first]; // 主线程打印
    
    [self second]; // 子线程打印
}

- (void)first {
    for (int i = 0; i < 100000; i++) {
        NSLog(@"i: %d, currentThread: %@", i, [NSThread currentThread]);
    }
}


//

@end


