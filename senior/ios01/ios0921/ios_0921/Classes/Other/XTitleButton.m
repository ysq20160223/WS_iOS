//
//  XTitleButton.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XTitleButton.h"

#import "UIView+X.h"

// 修改系统自带控件内部的子控件
// 1, 自定义这个控件
// 2, 重写 layoutsubviews

@implementation XTitleButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.titleLabel.xX > self.imageView.xX) {
        self.titleLabel.xX = self.imageView.xX;
        self.imageView.xX = CGRectGetMaxX(self.titleLabel.frame);
    }
    
//    NSLog(@"titleLabel.x: %f; imageView.x: %f", self.titleLabel.x, self.imageView.x);
}

//
- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


