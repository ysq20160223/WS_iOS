//
//  ViewController.m
//  ios_091308
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyView.h"

@interface ViewController ()

@property (nonatomic, strong) MyView *myView;
@property (nonatomic, strong) UIImageView *imageView;

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    XLog
    self.myView.image = [UIImage imageNamed:@"abx.png"];
    self.imageView.image = [UIImage imageNamed:@"abx.png"];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    XLog
    self.myView.image = [UIImage imageNamed:@"ab9.png"];
    self.imageView.image = [UIImage imageNamed:@"ab9.png"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self userUIImageView]; // 使用系统
    
    [self userMyView]; // 使用自定义
}

- (void)userMyView {
//    MyView *myView = [MyView.alloc initWithFrame:CGRectMake(0, 300, 100, 100)];
//    myView.image = [UIImage imageNamed:@"yellow.jpg"];
    
    self.myView = [MyView.alloc initWithImage:[UIImage imageNamed:@"ab9.png"]];
    self.myView.backgroundColor = UIColor.cyanColor;
    CGRect rect = self.myView.frame;
    rect.origin.y = kStatusBarH;
    self.myView.frame = rect;
    [self.view addSubview:self.myView];
}

- (void)userUIImageView {
//    UIImageView *imageView = [UIImageView.alloc initWithFrame:CGRectMake(0, 0, 100, 100)];
//    imageView.image = [UIImage imageNamed:@"aLi.png"];
    
    self.imageView = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"ab9.png"]];
    self.imageView.backgroundColor = UIColor.magentaColor;
    CGRect rect = self.imageView.frame;
    rect.origin.y = 200;
    self.imageView.frame = rect;
    [self.view addSubview:self.imageView];
}

@end


