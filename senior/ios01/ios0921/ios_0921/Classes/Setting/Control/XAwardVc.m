//
//  XAwardVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XAwardVc.h"

#import "XGroupItem.h"
#import "XSettingArrowItem.h"
#import "XSettingSwitchItem.h"

#import "XSettingCell.h"

@interface XAwardVc ()

@end



@implementation XAwardVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpGroup];
    
}

- (void)setUpGroup {
    // 1, 创建组模型
    XGroupItem *group = XGroupItem.alloc.init;
    
    // 2, 创建行模型
    XSettingSwitchItem *item0 = [XSettingSwitchItem itemWithImage:nil title:@"双色球" subTitle:@"每周二, 四, 日开奖"];
    XSettingSwitchItem *item1 = [XSettingSwitchItem itemWithImage:nil title:@"大乐透" subTitle:@"每周一, 三, 六开奖"];
    XSettingSwitchItem *item2 = [XSettingSwitchItem itemWithImage:nil title:@"3D" subTitle:@"每天开奖, 包括试机号提醒"];
    XSettingSwitchItem *item3 = [XSettingSwitchItem itemWithImage:nil title:@"七乐彩" subTitle:@"每周一, 三, 五开奖"];
    XSettingSwitchItem *item4 = [XSettingSwitchItem itemWithImage:nil title:@"七星彩" subTitle:@"每周二, 五, 日开奖"];
    XSettingSwitchItem *item5 = [XSettingSwitchItem itemWithImage:nil title:@"排列3" subTitle:@"每天开奖"];
    XSettingSwitchItem *item6 = [XSettingSwitchItem itemWithImage:nil title:@"排列5" subTitle:@"每天开奖"];
    
    // 3, 描述组模型中行模型数组
    group.itemArray = @[item0, item1, item2, item3, item4, item5, item6, item6];
    [self.groupArray addObject:group];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XSettingCell *cell = [XSettingCell cellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleSubtitle];
    
    XGroupItem *group = self.groupArray[indexPath.section];
    NSArray *items = group.itemArray;
    
    XSettingItem *item = items[indexPath.row];
    cell.item = item;
    return cell;
}

@end


