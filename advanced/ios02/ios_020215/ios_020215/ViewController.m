//
//  ViewController.m
//  ios_020215
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end



@implementation ViewController

#pragma mark -- 控制器的 view 加载完毕的时候会调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    NSLog(@"viewDidLoad");
    
    UIApplication *application = [UIApplication sharedApplication];
    CGRect rect = application.statusBarFrame;
    
    // 1, 创建按钮
    UIButton *btn = [[UIButton alloc] init]; // 1.1
    btn.frame = CGRectMake(0, rect.size.height, 100, 100); // 1.2 位置和尺寸
    [btn setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]]; // 背景颜色
    
    
    
    CGPoint centerPoint = btn.center;
    centerPoint.x = self.view.frame.size.width * 0.5;
    btn.center = centerPoint;
    
    // 1.3 设置普通状态属性
    [btn setBackgroundImage:[UIImage imageNamed:@"img_normal.png"] forState:UIControlStateNormal]; // 1.3.1 设置背景图片
    [btn setTitle:@"click" forState:UIControlStateNormal]; // 设置文字
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal]; // 文字颜色
    
    // 1.4 设置高亮状态属性
    [btn setBackgroundImage:[UIImage imageNamed:@"img_press_.png"] forState:UIControlStateHighlighted];
    [btn setTitle:@"what" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    // 1.5 监听按钮点击
    [btn addTarget:self action:@selector(btnCtrlEventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(btnCtrlEventTouchDown:) forControlEvents:UIControlEventTouchDown];
    
    // 2, 添加按钮到控制器的 view 中
    [self.view addSubview:btn];
    
    
    
    // --------------------------------------------- 020216
    // 3, 添加文本输入框
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(100, 300, 100, 50);
    textField.backgroundColor = [UIColor cyanColor];
    
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height * 0.5;
    textField.center = CGPointMake(centerX, centerY); // 重新设置中心
    NSLog(@"centerX: %f, centerY: %f", centerX, centerY);
    
    textField.font = [UIFont systemFontOfSize:21]; // 设置字体
    
    [self.view addSubview:textField];
}

//
- (void)btnCtrlEventTouchUpInside:(UIButton *)btn {
    NSLog(@"%p", btn);
    [btn setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]]; // 背景颜色
    btn.titleLabel.font = [UIFont systemFontOfSize:30]; // 文字大小
    
}

//
- (void)btnCtrlEventTouchDown:(UIButton *)btn {
    NSLog(@"%@", btn)
    [btn setBackgroundColor:[UIColor colorWithRed:1 green:0.5 blue:0 alpha:0.5]]; // 背景颜色
    btn.titleLabel.font = [UIFont systemFontOfSize:39]; // 文字大小
}

@end





