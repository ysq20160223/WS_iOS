//
//  MyAwardViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyAwardViewController.h"

#import "MyGroupItem.h"
#import "MySettingArrowItem.h"
#import "MySettingSwitchItem.h"

#import "MySettingCell.h"

@interface MyAwardViewController ()

@end

@implementation MyAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpGroup];
    
}

- (void)setUpGroup {
    // 1, 创建组模型
    MyGroupItem *group = [[MyGroupItem alloc] init];
    
    // 2, 创建行模型
    MySettingSwitchItem *item0 = [MySettingSwitchItem itemWithImage:nil title:@"双色球" subTitle:@"每周二, 四, 日开奖"];
    MySettingSwitchItem *item1 = [MySettingSwitchItem itemWithImage:nil title:@"大乐透" subTitle:@"每周一, 三, 六开奖"];
    MySettingSwitchItem *item2 = [MySettingSwitchItem itemWithImage:nil title:@"3D" subTitle:@"每天开奖, 包括试机号提醒"];
    MySettingSwitchItem *item3 = [MySettingSwitchItem itemWithImage:nil title:@"七乐彩" subTitle:@"每周一, 三, 五开奖"];
    MySettingSwitchItem *item4 = [MySettingSwitchItem itemWithImage:nil title:@"七星彩" subTitle:@"每周二, 五, 日开奖"];
    MySettingSwitchItem *item5 = [MySettingSwitchItem itemWithImage:nil title:@"排列3" subTitle:@"每天开奖"];
    MySettingSwitchItem *item6 = [MySettingSwitchItem itemWithImage:nil title:@"排列5" subTitle:@"每天开奖"];
    
    // 3, 描述组模型中行模型数组
    group.items = @[item0, item1, item2, item3, item4, item5, item6, item6];
    
    //
    [self.groups addObject:group];
    
}

//
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MySettingCell *cell = [MySettingCell cellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleSubtitle];
    
    MyGroupItem *group = self.groups[indexPath.section];
    NSArray *items = group.items;
    
    MySettingItem *item = items[indexPath.row];
    cell.item = item;
    return cell;
}

@end





