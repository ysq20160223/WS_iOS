//
//  MyGroupBuyViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XGroupBuyViewController.h"
#import "XTitleButton.h"
#import "UIImage+X.h"

@interface XGroupBuyViewController ()

@property (nonatomic, weak) XTitleButton *titleBtn;

@end



@implementation XGroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setUpNavBar];
    
    // 跳转到当前控件器的时候隐藏底部条
//    self.hidesBottomBarWhenPushed = YES;
    
    // 在 XNavigationController 中统一设置
    // 设置左边的按钮
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageNamed:@"NavBack"] style:0 target:self action:@selector(back)];
    
}


// 在 XNavigationController 中统一设置
//// 点击返回按钮返回上一个控制器
//- (void)back {
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)setUpNavBar {
    XTitleButton *titleBtn = [XTitleButton buttonWithType:UIButtonTypeCustom];
    _titleBtn = titleBtn;
    
    [titleBtn setTitle:@"All List" forState:UIControlStateNormal]; // 文字
    [titleBtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    self.navigationItem.titleView = titleBtn;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:0 target:self action:@selector(click)];
}

- (void)click {
    [_titleBtn setTitle:@"All - List" forState:UIControlStateNormal];
    
//    [_titleBtn sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

#pragma mark - UITableViewDataSource end

@end



