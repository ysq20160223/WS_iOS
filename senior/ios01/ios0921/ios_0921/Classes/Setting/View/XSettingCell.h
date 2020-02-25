//
//  MySettingCell.h
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XSettingItem;

@interface XSettingCell : UITableViewCell

@property (nonatomic, strong) XSettingItem *item;

//

+ (instancetype)cellWithTableView:(UITableView *)tableView tableViewCellStyle:(UITableViewCellStyle)tableViewCellStyle;

@end
