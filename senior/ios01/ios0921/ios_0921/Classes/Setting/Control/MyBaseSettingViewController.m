//
//  MyBaseSettingViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyBaseSettingViewController.h"

#import "MySettingCell.h"

#import "MyGroupItem.h"

#import "MySettingArrowItem.h"

@interface MyBaseSettingViewController ()

@end

@implementation MyBaseSettingViewController

// 点击 item 跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MyGroupItem *group = self.groups[indexPath.section];
    
    MySettingItem *item = group.items[indexPath.row];
    
    //
    if (item.operationBlock) {
        item.operationBlock(indexPath);
        return;
    }
    
    //
    if ([item isKindOfClass:[MySettingArrowItem class]]) {
        MySettingArrowItem *arrowItem = (MySettingArrowItem *)item;
        
        if (arrowItem.clazz) {
            UIViewController *vc = [[arrowItem.clazz alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}

// 总组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

// 每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MyGroupItem *group = self.groups[section];
    NSArray *items = group.items;
    return items.count;
}

// 每行具体数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MySettingCell *cell = [MySettingCell cellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleDefault];
    
    MyGroupItem *group = self.groups[indexPath.section];
    NSArray *items = group.items;
    
    MySettingItem *item = items[indexPath.row];
    cell.item = item;
    return cell;
}

// headTitle
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    MyGroupItem *group = self.groups[section];
    return group.headerTitle;
}

// footerTitle
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    MyGroupItem *group = self.groups[section];
    return group.footerTitle;
}

// 初始化
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

// 懒加载
- (NSMutableArray *)groups {
    if (nil == _groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}



@end



