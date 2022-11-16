//
//  ViewController.m
//  ios_04
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "_Vc.h"
#import "SecondVc.h"

@interface _Vc ()

- (IBAction)toSecond:(id)sender;

@end



@implementation _Vc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Nav -> _Vc"; // 设置导航条标题
//    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
}

- (IBAction)toSecond:(id)sender {
    SecondVc *secondVc = SecondVc.alloc.init;
    [self.navigationController pushViewController:secondVc animated:YES];
}

@end




