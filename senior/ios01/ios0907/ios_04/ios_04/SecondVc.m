//
//  SecondViewController.m
//  ios_04
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SecondVc.h"

@interface SecondVc ()

@end



@implementation SecondVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = NSStringFromClass(SecondVc.class);
    
    // --------- right
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStyleDone target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    
    // --------- left
    // 系统默认会把导航条上的图片渲染成蓝色
//    UIImage *img = [UIImage imageNamed:@"navigationbar_friendsearch@2x"];
//    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 不被渲染
//    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStyleDone target:self action:@selector(leftClick)];
    
    // 自定义
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"navigationbar_friendsearch@2x"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted@2x"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:btn];;
}


- (void)leftClick {
    XLog
}

- (void)rightClick {
    XLog
}

- (IBAction)pop:(UIButton *)sender {
    XLog
    [self.navigationController popViewControllerAnimated:YES];
}

@end







