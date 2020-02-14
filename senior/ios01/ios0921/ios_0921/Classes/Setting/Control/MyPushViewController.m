//
//  MyPushViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyPushViewController.h"

#import "MyGroupItem.h"
#import "MySettingArrowItem.h"

//
#import "MyAwardViewController.h"
#import "MyScoreViewController.h"

@interface MyPushViewController ()

@end


@implementation MyPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setUpGroups];
    
    
}

- (void)setUpGroups {
    // 1, 创建组模型
    MyGroupItem *group = [[MyGroupItem alloc] init];
    
    // 2, 创建行模型
    MySettingArrowItem *item0 = [MySettingArrowItem itemWithImage:nil title:@"开奖推送"];
    item0.clazz = [MyAwardViewController class];
    
    MySettingArrowItem *item1 = [MySettingArrowItem itemWithImage:nil title:@"比分直播推送"];
    item1.clazz = [MyScoreViewController class];
    
    MySettingArrowItem *item2 = [MySettingArrowItem itemWithImage:nil title:@"中奖动画"];
    MySettingArrowItem *item3 = [MySettingArrowItem itemWithImage:nil title:@"购彩提醒"];
    
//    item1.operationBlock = ^{
//        NSLog(@"0 : 0");
//    };
    
    group.items = @[item0, item1, item2, item3];
    
    // 3, 
    [self.groups addObject:group];
    
}

//


@end



