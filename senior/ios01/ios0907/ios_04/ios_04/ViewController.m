//
//  ViewController.m
//  ios_04
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

- (IBAction)toSecond:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Nav -> ViewController"; // 设置导航条标题
//    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
}

- (IBAction)toSecond:(id)sender {
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVc animated:YES];
}

@end




