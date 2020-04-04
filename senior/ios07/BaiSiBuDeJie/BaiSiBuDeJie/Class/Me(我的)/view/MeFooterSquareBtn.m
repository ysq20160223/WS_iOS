//
//  MeFooterSquareView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/29.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeFooterSquareBtn.h"
#import "UIView+X.h"

@implementation MeFooterSquareBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    
}

- (void)layoutSubviews {
    self.imageView.xY = self.xHeight * 0.2;
    self.imageView.xHeight = self.xHeight * 0.5;
    self.imageView.xWidth = self.imageView.xHeight;
    self.imageView.xCenterX = self.xWidth * 0.5;
    
    self.titleLabel.xX = 0;
    self.titleLabel.xWidth = self.xWidth;
    self.titleLabel.xY = self.imageView.xBottom;
    self.titleLabel.xHeight = self.xHeight - self.titleLabel.xY;
}

@end


