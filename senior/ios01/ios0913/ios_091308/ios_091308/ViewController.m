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

@property (nonatomic, weak) MyView *myView;
@property (nonatomic, weak) UIImageView *imageView;

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"");
    self.myView.image = [UIImage imageNamed:@"abx.png"];
    self.imageView.image = [UIImage imageNamed:@"abx.png"];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"");
    self.myView.image = [UIImage imageNamed:@"ab9.png"];
    self.imageView.image = [UIImage imageNamed:@"ab9.png"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self userUIImageView]; // 使用系统
    
    [self userMyView]; // 使用自定义
}

- (void)userMyView {
//    MyView *myView = [[MyView alloc] initWithFrame:CGRectMake(0, 300, 100, 100)];
//    myView.image = [UIImage imageNamed:@"yellow.jpg"];
    
    MyView *myView = [[MyView alloc] initWithImage:[UIImage imageNamed:@"ab9.png"]];
    myView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    CGRect rect = myView.frame;
    rect.origin.y = kStatusBarH;
    myView.frame = rect;
    [self.view addSubview:myView];
    
    _myView = myView;
}

- (void)userUIImageView {
//    UIImageView *imageView = [UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100);
//    imageView.image = [UIImage imageNamed:@"aLi.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ab9.png"]];
    imageView.backgroundColor = [UIColor colorWithRed:0 green:.5 blue:1 alpha:1];
    CGRect rect = imageView.frame;
    rect.origin.y = 200;
    imageView.frame = rect;
    [self.view addSubview:imageView];
    
    _imageView = imageView;
}

@end


