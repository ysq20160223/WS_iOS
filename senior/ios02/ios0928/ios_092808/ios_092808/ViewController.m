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
    
    self.totalTicker = 20;
    
    self.thread0 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
    self.thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
    
    self.thread0.name = @"thread0";
    self.thread1.name = @"thread1";
    self.thread2.name = @"thread2";
    
}

- (void)run:(NSString *)str {
    while (1) {
        @synchronized (self) {
            [NSThread sleepForTimeInterval:.03];
            if (self.totalTicker > 0) {
                NSLog(@"%@ - name:%@ - %d", [NSThread currentThread], str, self.totalTicker);
                self.totalTicker = self.totalTicker - 1;
            } else {
                NSLog(@"%@ - name:%@", [NSThread currentThread], str);
                break;
            }
        }
    }
}


@end


