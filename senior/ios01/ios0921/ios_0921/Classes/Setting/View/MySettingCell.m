//
//  MySettingCell.m
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MySettingCell.h"

#import "MySettingItem.h"
#import "MySettingArrowItem.h"
#import "MySettingSwitchItem.h"

@interface MySettingCell ()

@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation MySettingCell

- (UISwitch *)switchView {
    if(_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

//
- (void)setItem:(MySettingItem *)item {
    _item = item;
    
    //
    self.imageView.image = item.image;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    
    //
    if ([item isKindOfClass:[MySettingArrowItem class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if ([item isKindOfClass:[MySettingSwitchItem class]]) {
        self.accessoryView = self.switchView;
    } else {
        self.accessoryView = nil;
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}


//
+ (instancetype)cellWithTableView:(UITableView *)tableView tableViewCellStyle:(UITableViewCellStyle)tableViewCellStyle {
    static NSString *ID = @"cellId";
    
    MySettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:tableViewCellStyle reuseIdentifier:ID];
    }
    return cell;
}

@end
