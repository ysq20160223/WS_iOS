//
//  LrcTableViewCell.h
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LrcLabel;

@interface LrcTableViewCell : UITableViewCell

+ (instancetype)lrcCell:(UITableView *)tableView;

@property (nonatomic, weak) LrcLabel *lrcLabel;

@end

NS_ASSUME_NONNULL_END
