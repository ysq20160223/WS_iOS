//
//  MySettingViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XSettingViewController.h"

#import "XGroupItem.h"

#import "XSettingItem.h"
#import "XSettingArrowItem.h"
#import "XSettingSwitchItem.h"

#import "XPushViewController.h"

@interface XSettingViewController ()

@end



@implementation XSettingViewController

// 设置界面 : MVC
// 1, 设计模型, 用来保存控件最想要的数据
// 1.1, 每一 cell 需要对应模型(image, title)
// 2, 布局界面 : tableview
// 3, 观察有多少组, 创建数组记录当前的组数
// 4, 观察每一组的行数
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 创建模型数据
    [self setUpGroups];
}

- (void)setUpGroups {
    // 第一组数据
    XGroupItem *groupFirst = [[XGroupItem alloc] init];
    XSettingArrowItem *redeemCode = [XSettingArrowItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    groupFirst.items = @[redeemCode];
    [self.groups addObject:groupFirst];
    
    
    // 第二组数据
    XGroupItem *groupSecond = [[XGroupItem alloc] init];
    
    XSettingArrowItem *morePush = [XSettingArrowItem itemWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    morePush.clazz = [XPushViewController class]; // 点击 item 跳转的 ViewController
    
    XSettingSwitchItem *handShake = [XSettingSwitchItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"摇一摇"];
    XSettingSwitchItem *soundEffect = [XSettingSwitchItem itemWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    XSettingSwitchItem *moreLotteryRecommend = [XSettingSwitchItem itemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    
//    handShake.type= MySettingItemTypeSwitch;
//    soundEffect.type= MySettingItemTypeSwitch;
//    moreLotteryRecommend.type= MySettingItemTypeSwitch;

    groupSecond.items = @[morePush, handShake, soundEffect, moreLotteryRecommend];
    
    [self.groups addObject:groupSecond];
    
    
    // 第三组数据
    XGroupItem *groupThird = [[XGroupItem alloc] init];
    
    XSettingArrowItem *moreUpdate = [XSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreUpdate"] title:@"检查新版本"];
    XSettingArrowItem *moreShare = [XSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    XSettingArrowItem *moreNetease = [XSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    XSettingArrowItem *moreAbout = [XSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    
    moreUpdate.operationBlock = ^(NSIndexPath *indexPath){
        NSLog(@"check new version, indexPath: %@", indexPath);
    };
  
    groupThird.items = @[moreUpdate, moreShare, moreNetease, moreAbout];
    
    [self.groups addObject:groupThird];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"destinationViewController: %@", segue.destinationViewController)
}


@end


