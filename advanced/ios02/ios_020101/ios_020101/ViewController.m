//
//  ViewController.m
//  ios_020101
//
//  Created by Apple on 2017/7/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    self.navigationItem.title = @"ViewController";
}

- (void)onClick:(UIButton *)btn {
    NSLog(@"count: %ld", self.view.subviews.count);
    
    if (1 == btn.tag) {
        NSLog(@"%@", btn);
    } else if (2 == btn.tag) {
        NSLog(@"%@", btn);
    }
}

@end


