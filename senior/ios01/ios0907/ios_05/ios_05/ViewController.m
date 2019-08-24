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
    
    NSLog(@"%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"%s", __func__);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"%s", __func__);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // 清空缓存 - 图片缓存
    
}


//
- (void)viewWillUnload {

}

- (void)viewDidUnload {

}

@end





