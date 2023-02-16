//
//  XBaseSettingVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XBaseSettingVc.h"

#import "XSettingCell.h"

#import "XGroupItem.h"

#import "XSettingArrowItem.h"

#import "XPushVc.h"

@interface XBaseSettingVc ()

@end



@implementation XBaseSettingVc


#pragma mark - UITableViewDelegate start
// 点击 item 跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XGroupItem *group = self.groups[indexPath.section];
    
    XSettingItem *item = group.items[indexPath.row];
    
    if (item.operationBlock) {
        item.operationBlock(indexPath);
        return;
    }
    
    if ([item isKindOfClass:XSettingArrowItem.class]) {
        XSettingArrowItem *arrowItem = (XSettingArrowItem *)item;
        if (arrowItem.clazz) {
            UIViewController *vc = [arrowItem.clazz.alloc init];
//            NSLog(@"vc: %@", vc);
            
            if ([vc isKindOfClass:XPushVc.class]) {
                XPushVc *pushVc = (XPushVc *)vc;
                pushVc.xSettingArrowItem = arrowItem;
                [self.navigationController pushViewController:pushVc animated:YES];
            } else {
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    }
}
#pragma mark - UITableViewDelegate end


#pragma mark - UITableViewDataSource start
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    XGroupItem *group = self.groups[section];
    NSArray *items = group.items;
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XSettingCell *cell = [XSettingCell cellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleDefault];
    
    XGroupItem *group = self.groups[indexPath.section];
    NSArray *items = group.items;
    
    XSettingItem *item = items[indexPath.row];
    cell.item = item;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    XGroupItem *group = self.groups[section];
    return group.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    XGroupItem *group = self.groups[section];
    return group.footerTitle;
}
#pragma mark - UITableViewDataSource end

// 初始化
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}


- (NSMutableArray *)groups {
    if (nil == _groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


@end


