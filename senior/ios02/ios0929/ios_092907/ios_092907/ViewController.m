//
//  ViewController.m
//  ios_092907
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end



@implementation ViewController

// -----
- (IBAction)start:(UIButton *)sender {
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    queue.maxConcurrentOperationCount = 1;
    
    for (int i = 0; i < 5; i++) {
        // 2
        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            [NSThread sleepForTimeInterval:1.0];
            
            NSLog(@"%d - %@", i, [NSThread currentThread]);
        }];
        
        // 3
        [queue addOperation:op];
    }
    _queue = queue;
    
}

- (IBAction)suspended:(UIButton *)sender {
    self.queue.suspended = !self.queue.suspended;
}

- (IBAction)cancel:(UIButton *)sender {
    [self.queue cancelAllOperations];
}

// -----

// -------
- (IBAction)maxConcurrentOperationCount:(UIButton *)sender {
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 默认是并发队列, 如果最大并发数 > 1, 并发
    // 如果最大并发数 == 1, 串行队列
    // 系统的默认是最大并发数 -1 (不限制)
    queue.maxConcurrentOperationCount = 3;
    
    // 2
    for (int i = 0; i < 5; i++) {
        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%d - %@", i, [NSThread currentThread]);
        }];
        
        // 3
        [queue addOperation:op];
    }
}
// -------

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}



@end


