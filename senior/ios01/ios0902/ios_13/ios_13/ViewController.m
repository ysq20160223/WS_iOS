//
//  ViewController.m
//  ios_13
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "BgView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"view: %@, color: %@", self.view, self.view.backgroundColor);
}

// 当控制器的 view 第一次使用的时候就会调用
// 自定义控制器的 view 就会调用这个方法
- (void)loadView {
    NSLog(@"");
    // 方法1, 调用系统默认方法
//    [super loadView];
    
    // 方法2, 调用自定义View
    BgView *view = [[BgView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor cyanColor];
    self.view = view;
}





@end
