//
//  ViewController.m
//  ios_020501
//
//  Created by Apple on 2017/7/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    1, 显示图片
        UIImageView只能显示一种图片(图片默认会填充整个UIImageView)
        UIBotton能显示两种图片, 显示文字
            背景 : 填充整个UIBotton
            前景 : 按照之前的尺寸显示
 
    2, 点击事件
        UIImageView默认是不能响应点击事件
        UIBotton能响应点击事件
 
 */

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1
    UIImageView *iv = [UIImageView.alloc init];
    iv.image = [UIImage imageNamed:@"014.png"];
    iv.backgroundColor = UIColor.magentaColor;
    iv.frame = CGRectMake(0, UIApplication.sharedApplication.statusBarFrame.size.height, 120, 120);
    [self.view addSubview:iv];
    
    // 2
    UIButton *btn = [UIButton.alloc init];
    [btn setBackgroundImage:[UIImage imageNamed:@"bg.png"] forState:UIControlStateNormal];
//    btn.backgroundColor = UIColor.cyanColor;
    [btn setImage:[UIImage imageNamed:@"016.png"] forState:UIControlStateNormal];
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 200, 120, 120);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside]; //
    [self.view addSubview:btn];
    
    // 3 - UISlider
    UISlider *slider = [UISlider.alloc init];
    slider.frame = CGRectMake(10, 400, self.view.frame.size.width - 20, 100);
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    [slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

- (void)btnClick:(UIButton *)btn {
    NSLog(@"btn:%@", btn);
}

- (void)changeValue:(UISlider *)slider {
    NSLog(@"changeValue:%f", slider.value);
}


@end



