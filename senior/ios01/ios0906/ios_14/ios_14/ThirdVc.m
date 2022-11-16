//
//  ThirdViewController.m
//  ios_14
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ThirdVc.h"

@interface ThirdVc ()

- (IBAction)back:(UIButton *)sender;

- (IBAction)backRoot:(id)sender;

@end




@implementation ThirdVc

// 090703
// 返回
- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    self.navigationItem.title = @"Third";
    
    NSLog(@"%@", self.navigationController.childViewControllers);
}

- (IBAction)backRoot:(id)sender {
    // 返回到导航控制器的根控制器
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    // 返回到指定的控制器
    [self.navigationController popToViewController:self.navigationController.childViewControllers[0] animated:YES];
}

@end



