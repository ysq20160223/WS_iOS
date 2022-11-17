//
//  YYViewController.m
//  ios_06
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YVc.h"

@interface YVc ()

@end




@implementation YVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // tableView 里面的内容, 头部视图, 位置都是由系统决定, 只能决定高度
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 210)];
    headView.backgroundColor = [UIColor cyanColor];
    
    self.tableView.tableHeaderView = headView;
    
    self.automaticallyAdjustsScrollViewInsets = NO; // 不需要额外的滚动区域
    
    [self setUpNavigation];
}

- (void) setUpNavigation {
    // UIBarMetricsDefault : 只有设置这种样式, 才能设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]]; // 清空导航条的阴影的线
    
    // 标题透明
    UILabel *label = [[UILabel alloc] init];
    label.text = @"YY";
    [label sizeToFit];
    label.textColor = [UIColor colorWithWhite:1 alpha:0];
    [self.navigationItem setTitleView:label];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
//    NSLog(@"contentInset top : %f", self.tableView.contentInset.top);
    
}

@end



