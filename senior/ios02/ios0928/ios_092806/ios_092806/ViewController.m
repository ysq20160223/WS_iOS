//
//  ViewController.m
//  ios_092806
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)btnClick:(UIButton *)sender {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [thread start];
}


- (void)run {
    NSLog(@"%s - %@", __func__, [NSThread currentThread]);
    
    // 阻塞状态
//    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
    
//    [NSThread sleepForTimeInterval:3];
    
    for (int i = 0; i < 100; i++) {
        NSLog(@"i = %d", i);
        if (50 == i) {
//            [NSThread exit]; // 退出
//            return;
            break;
        }
    }
    
    NSLog(@"run end");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


@end


