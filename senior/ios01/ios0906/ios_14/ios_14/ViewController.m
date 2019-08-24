//
//  ViewController.m
//  ios_14
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)jump2Two:(id)sender {
    // 只有导航控制器才有跳转功能
    // 只要是导航控制器的子控制器就能拿到导航控制器
    NSLog(@"%@", self.navigationController);
    
    TwoViewController *twoViewController = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoViewController animated:YES];
    
    // 会把 push 的控制器添加微导航控制器的子控制器, 而且会把新 push 的控制器的 view 添加到导航控制的view上
    
    NSLog(@"%@", self.navigationController.childViewControllers);
}


@end





