//
//  LrcTableViewCell.m
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LrcTableViewCell.h"

#import "LrcLabel.h"

#import "Masonry.h"

@implementation LrcTableViewCell


+ (instancetype)lrcCell:(UITableView *)tableView {
    static NSString *ID = @"cellId";
    LrcTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [LrcTableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //
        LrcLabel *lrcLabel = [LrcLabel.alloc init];
        [self.contentView addSubview:lrcLabel];
        self.lrcLabel = lrcLabel;
        
        [lrcLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
        }];
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.lrcLabel.textColor = [UIColor whiteColor];
        self.lrcLabel.textAlignment = NSTextAlignmentCenter;
        self.lrcLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

@end


