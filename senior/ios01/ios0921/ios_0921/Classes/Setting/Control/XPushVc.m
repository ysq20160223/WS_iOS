//
//  XPushVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XPushVc.h"

#import "XGroupItem.h"
#import "XSettingArrowItem.h"

//
#import "XAwardVc.h"
#import "XScoreVc.h"

@interface XPushVc ()

@end



@implementation XPushVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"xSettingArrowItem: %@", self.xSettingArrowItem);
    self.navigationItem.title = self.xSettingArrowItem.title;
    
    [self setUpGroups];
}

- (void)setUpGroups {
    // 1, 创建组模型
    XGroupItem *group = XGroupItem.alloc.init;
    
    // 2, 创建行模型
    XSettingArrowItem *item0 = [XSettingArrowItem itemWithImage:nil title:@"开奖推送"];
    item0.clazz = XAwardVc.class;
    
    XSettingArrowItem *item1 = [XSettingArrowItem itemWithImage:nil title:@"比分直播推送"];
    item1.clazz = XScoreVc.class;
    
    XSettingArrowItem *item2 = [XSettingArrowItem itemWithImage:nil title:@"中奖动画"];
    XSettingArrowItem *item3 = [XSettingArrowItem itemWithImage:nil title:@"购彩提醒"];
    
//    item1.operationBlock = ^{
//        NSLog(@"0 : 0");
//    };
    
    group.items = @[item0, item1, item2, item3];
    
    // 3, 
    [self.groups addObject:group];
}

@end


