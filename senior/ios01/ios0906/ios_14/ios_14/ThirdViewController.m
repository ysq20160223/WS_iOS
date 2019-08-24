//
//  ThirdViewController.m
//  ios_14
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

- (IBAction)back:(UIButton *)sender;

- (IBAction)backRoot:(id)sender;

@end




@implementation ThirdViewController

// 090703
// 返回
- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backRoot:(id)sender {
    // 返回到导航控制器的根控制器
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    // 返回到指定的控制器
    [self.navigationController popToViewController:self.navigationController.childViewControllers[0] animated:YES];
}

@end



