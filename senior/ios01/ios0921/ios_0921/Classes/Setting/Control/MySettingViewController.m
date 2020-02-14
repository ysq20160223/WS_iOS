//
//  MySettingViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MySettingViewController.h"

#import "MyGroupItem.h"

#import "MySettingItem.h"
#import "MySettingArrowItem.h"
#import "MySettingSwitchItem.h"

#import "MyPushViewController.h"

@interface MySettingViewController ()

@end

@implementation MySettingViewController

// 设置界面 : MVC
// 1, 设计模型, 用来保存控件最想要的数据
// 1.1, 每一 cell 需要对应模型(image, title)
// 2, 布局界面 : tableview
// 3, 观察有多少组, 创建数组记录当前的组数
// 4, 观察每一组的行数
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 手动创建模型数据
    [self setUpGroups];
    
}

- (void)setUpGroups {
    // 第一组数据
    MyGroupItem *group0 = [[MyGroupItem alloc] init];
//    group0.headerTitle = @"0";
//    group0.footerTitle = @"a";
    
    MySettingArrowItem *redeemCode = [MySettingArrowItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];

    NSArray *items0 = @[redeemCode];
    group0.items = items0;
    
    [self.groups addObject:group0];
    
    // 第二组数据
    MyGroupItem *group1 = [[MyGroupItem alloc] init];
    
    MySettingArrowItem *morePush = [MySettingArrowItem itemWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    MySettingSwitchItem *handShake = [MySettingSwitchItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"摇一摇"];
    MySettingSwitchItem *soundEffect = [MySettingSwitchItem itemWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    MySettingSwitchItem *moreLotteryRecommend = [MySettingSwitchItem itemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    
    morePush.clazz = [MyPushViewController class]; // 点击 item 跳转的 ViewController
    
//    handShake.type= MySettingItemTypeSwitch;
//    soundEffect.type= MySettingItemTypeSwitch;
//    moreLotteryRecommend.type= MySettingItemTypeSwitch;
    
    NSArray *items1 = @[morePush, handShake, soundEffect, moreLotteryRecommend];
    group1.items = items1;
    
    [self.groups addObject:group1];
    
    // 第三组数据
    MyGroupItem *group2 = [[MyGroupItem alloc] init];
    
    MySettingArrowItem *moreUpdate = [MySettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreUpdate"] title:@"检查新版本"];
    MySettingArrowItem *moreShare = [MySettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    MySettingArrowItem *moreNetease = [MySettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    MySettingArrowItem *moreAbout = [MySettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    
    moreUpdate.operationBlock = ^(NSIndexPath *indexPath){
        NSLog(@"check new version");
    };
    
    NSArray *items2 = @[moreUpdate, moreShare, moreNetease, moreAbout];
    group2.items = items2;
    
    [self.groups addObject:group2];
    
}


@end





