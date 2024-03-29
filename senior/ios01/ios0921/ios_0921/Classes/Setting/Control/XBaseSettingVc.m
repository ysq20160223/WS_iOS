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
    
    XSettingItem *item = self.groupArray[indexPath.section].itemArray[indexPath.row];
    
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
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groupArray[section].itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XSettingCell *cell = [XSettingCell cellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleDefault];
    
    XSettingItem *item = self.groupArray[indexPath.section].itemArray[indexPath.row];
    cell.item = item;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.groupArray[section].headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.groupArray[section].footerTitle;
}
#pragma mark - UITableViewDataSource end

// 初始化
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}


- (NSMutableArray *)groupArray {
    if (!_groupArray) {
        _groupArray = NSMutableArray.array;
    }
    return _groupArray;
}


@end


