//
//  ViewController.m
//  ios_05
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 01, 一般以 view 开头的方法, 都是 view 的生命周期
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

// viewDidLoad
// viewWillAppear:
// viewWillLayoutSubviews
// viewDidLayoutSubviews
// viewWillDisappear:
// viewDidDisappear:

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // 清空缓存 - 图片缓存
    
}


// 非 arc 模式下
- (void)viewWillUnload {
    NSLog(@"");
}

- (void)viewDidUnload {
    NSLog(@"");
}



- (IBAction)left:(UIButton *)sender {
    NSLog(@"left");
}

- (IBAction)right:(UIBarButtonItem *)sender {
    NSLog(@"right");
}

@end





