//
//  XSettingCell.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XSettingCell.h"

#import "XSettingItem.h"
#import "XSettingArrowItem.h"
#import "XSettingSwitchItem.h"

@interface XSettingCell ()

@property (nonatomic, strong) UISwitch *switchView;

@end



@implementation XSettingCell

- (UISwitch *)switchView {
    if(!_switchView) {
        _switchView = UISwitch.alloc.init;
    }
    return _switchView;
}

//
- (void)setItem:(XSettingItem *)item {
    _item = item;
    
    self.imageView.image = item.image;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    
    if ([item isKindOfClass:XSettingArrowItem.class]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if ([item isKindOfClass:XSettingSwitchItem.class]) {
        self.accessoryView = self.switchView;
    } else {
        self.accessoryView = nil;
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView tableViewCellStyle:(UITableViewCellStyle)tableViewCellStyle {
    static NSString *ID = @"cellId";
    
    XSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [self.alloc initWithStyle:tableViewCellStyle reuseIdentifier:ID];
    }
    return cell;
}

@end


