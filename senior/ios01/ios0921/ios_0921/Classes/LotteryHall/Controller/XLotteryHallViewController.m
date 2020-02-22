//
//  MyLotteryHallViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XLotteryHallViewController.h"

#import "UIImage+X.h"

#import "XCover.h"
#import "XPopMenu.h"

@interface XLotteryHallViewController () <XPopMenuDelegate> {
    NSInteger _screenW;
    NSInteger _screenH;
}

@end



@implementation XLotteryHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _screenW = [UIScreen mainScreen].bounds.size.width;
    _screenH = [UIScreen mainScreen].bounds.size.height;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageNamed:@"CS50_activity_image"] style:0 target:self action:@selector(activity)];
    
    // 测试左右 BarButtonItem
//    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageNamed:@"CPArenaSegmentSelectedBG"] style:0 target:self action:@selector(activity)];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageNamed:@"CPArenaSegmentSelectedBG"] style:0 target:self action:@selector(activity)];
}

- (void)activity {
//    NSLog(@"");
    // 1, 弹出蒙版, 蒙版上有 pop
    [XCover show];
    
    // 2,
    XPopMenu *popMenu = [XPopMenu showInPoint:CGPointMake(_screenW * .5, _screenH * .5)];
    popMenu.delegate = self;
}

- (void)popMenuDidClickClose:(XPopMenu *)popMenu {
//    [popMenu hideInPoint:CGPointMake(24, 44)];
//    [MyCover hide];
    
    void (^popMenuHide)() = ^() {
        [XCover hide];
    };
    
    [popMenu hideInPoint:CGPointMake(44, kStatusBarH + self.navigationController.navigationBar.frame.size.height / 2) completion:popMenuHide];
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



