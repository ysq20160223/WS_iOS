//
//  ViewController.m
//  ios_020215
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "../../../../PreHeader.h"


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
    CGPoint centerPoint = btn.center;
    centerPoint.x = self.view.frame.size.width * 0.5;
    btn.center = centerPoint;
    
    // 1.3 设置普通状态下的属性
    [btn setBackgroundImage:[UIImage imageNamed:@"oc.png"] forState:UIControlStateNormal]; // 1.3.1 设置背景图片
    [btn setTitle:@"click" forState:UIControlStateNormal]; // 1.3.2 设置文字
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal]; // 1.3.3 设置文字颜色
    
    // 1.4 设置高亮状态的属性
    [btn setBackgroundImage:[UIImage imageNamed:@"qi.png"] forState:UIControlStateHighlighted];
    [btn setTitle:@"what" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    // 1.5 监听按钮点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 2, 添加按钮到控制器的 view 中
    [self.view addSubview:btn];
    
    
    // 020216
    // 3, 添加文本输入框
    UITextField *field = [[UITextField alloc] init];
    field.frame = CGRectMake(100, 300, 100, 50);
    field.backgroundColor = [UIColor cyanColor];
    
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height * 0.5;
    field.center = CGPointMake(centerX, centerY); // 重新设置中心
    NSLog(@"centerX: %f, centerY: %f", centerX, centerY);
    
    // 设置字体
    field.font = [UIFont systemFontOfSize:21];
    
    [self.view addSubview:field];
}

- (void)btnClick:(UIButton *)btn {
    NSLog(@"%p", btn);
}

@end





