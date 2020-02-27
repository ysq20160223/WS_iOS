//
//  ViewController.m
//  ios_092808
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread0;
@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;

@property (nonatomic, assign) int totalTicker;

@end



@implementation ViewController

- (IBAction)btnClick:(UIButton *)sender {
    [self.thread0 start];
    [self.thread1 start];
    [self.thread2 start];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.totalTicker = 200;
    
    self.thread0 = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    self.thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    self.thread0.name = @"thread --- 0";
    self.thread1.name = @"thread ++++++ 1";
    self.thread2.name = @"thread ********* 2";
}

- (void)run {
    while (1) {
        @synchronized (self) {
            [NSThread sleepForTimeInterval:.03];
            if (self.totalTicker > 0) {
                NSLog(@"%@,  totalTicker: %d", [NSThread currentThread], self.totalTicker);
                self.totalTicker--;
            } else {
                NSLog(@"%@,  totalTicker: %d", [NSThread currentThread], self.totalTicker);
                break;
            }
        }
    }
    NSLog(@"run end, %@", [NSThread currentThread]);
}

@end


