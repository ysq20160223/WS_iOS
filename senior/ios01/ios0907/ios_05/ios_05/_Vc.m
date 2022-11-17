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

#import "_Vc.h"

@interface _Vc ()

@end

// viewDidLoad
// viewWillAppear:
// viewWillLayoutSubviews
// viewDidLayoutSubviews
// viewWillDisappear:
// viewDidDisappear:

@implementation _Vc

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    XLog
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    XLog
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    XLog
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    XLog
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    XLog
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XLog
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // 清空缓存 - 图片缓存
    XLog
}


// 非 arc 模式下
- (void)viewWillUnload {
    XLog
}

- (void)viewDidUnload {
    XLog
}



- (IBAction)left:(UIButton *)sender {
    NSLog(@"left");
}

- (IBAction)right:(UIBarButtonItem *)sender {
    NSLog(@"right");
}

@end


