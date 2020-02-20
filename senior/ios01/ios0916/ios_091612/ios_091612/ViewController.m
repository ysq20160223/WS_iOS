//
//  ViewController.m
//  ios_091612
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "WheelView.h"

@interface ViewController ()

@property (nonatomic, strong) WheelView *wheelView;

@end



@implementation ViewController

- (IBAction)stop:(UIButton *)sender {
    [self.wheelView stop];
}

- (IBAction)start:(UIButton *)sender {
    [self.wheelView start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WheelView *wheelView = [WheelView wheelView]; // 1 - 开发常用
//    WheelView *wheelView = [[WheelView alloc] init]; // 2
    
    wheelView.center = self.view.center;
    [self.view addSubview:wheelView];
    
    self.wheelView = wheelView;
}

@end


