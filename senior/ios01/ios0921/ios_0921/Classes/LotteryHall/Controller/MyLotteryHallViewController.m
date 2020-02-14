//
//  MyLotteryHallViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyLotteryHallViewController.h"

#import "UIImage+Image.h"

#import "MyCover.h"
#import "MyPopMenu.h"

@interface MyLotteryHallViewController () <MyPopMenuDelegate>

@end

@implementation MyLotteryHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageWithOriginalImageNamed:@"CS50_activity_image"];
    
    // 创建 item
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:0 target:self action:@selector(activity)];
    
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)activity {
//    NSLog(@"%s", __func__);
    
    // 1, 弹出蒙版, 蒙版上有 pop
    [MyCover show];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    // 2,
    MyPopMenu *popMenu = [MyPopMenu showInPoint:CGPointMake(screenW * .5, screenH * .5)];
    popMenu.delegate = self;
    
}

- (void)popMenuDidClickClose:(MyPopMenu *)popMenu {
//    [popMenu hideInPoint:CGPointMake(24, 44)];
//    [MyCover hide];
    
    void (^popMenuHide)() = ^() {
        [MyCover hide];
    };
    
    [popMenu hideInPoint:CGPointMake(24, 44) completion:popMenuHide];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end



