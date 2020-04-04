//
//  HorizontalBtn.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/22.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "VerticalBtn.h"
#import "UIView+X.h"

@implementation VerticalBtn

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"width: %f; height: %f", self.xWidth, self.xHeight);

    self.imageView.xY = 0;
    self.imageView.xCenterX = self.xWidth * 0.5;
//    self.imageView.backgroundColor = XColor(0xff, 0x88, 0x00);

    self.titleLabel.xX = 0;
    self.titleLabel.xY = self.imageView.xBottom;
    self.titleLabel.xWidth = self.xWidth;
    self.titleLabel.xHeight = self.xHeight - self.imageView.xHeight;
//    self.titleLabel.backgroundColor = XColor(0x00, 0xff, 0xff);
}

@end
