//
//  ViewController.m
//  ios_092908
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end



@implementation ViewController

- (IBAction)cancel:(UIButton *)sender {
    [self.queue cancelAllOperations];
}


- (IBAction)start:(UIButton *)sender {
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2
    MyOperation *op = [[MyOperation alloc] init];
    
    // 3
    [queue addOperation:op];
    
    self.queue = queue;
}

@end


