//
//  CmtTableViewHeaderFooterView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/13.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "CmtTableViewHeaderFooterView.h"
#import "BSConst.h"

@implementation CmtTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.contentView.backgroundColor = BSCommonBgColor;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLabel.font = [UIFont boldSystemFontOfSize:12];
}

@end
