//
//  ViewController.m
//  ios_092804
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    
 */

#import "ViewController.h"

#import <pthread.h>

@interface ViewController ()

@end



@implementation ViewController

void *run(void *param) {
    
//    NSLog(@"%s - %@", __func__, [NSThread currentThread]);
    
    for (NSInteger i = 0; i < 2000; i++) {
        NSLog(@"i: %zd, %@", i, [NSThread currentThread]);
    }
    
    return NULL;
}


- (IBAction)btnClick:(UIButton *)sender {
    
    NSLog(@"%@", [NSThread currentThread]);
    
    //
    for (int i = 0; i < 2; i++) {
        pthread_t thread;
        
        pthread_create(&thread, NULL, run, NULL); // 开启线程
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

@end


