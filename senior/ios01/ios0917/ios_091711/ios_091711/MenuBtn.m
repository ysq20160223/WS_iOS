//
//  ItemBtn.m
//  ios_091711
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MenuBtn.h"

@implementation MenuBtn


- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.imageView.contentMode = UIViewContentModeCenter; // 
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.8;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    self.imageView.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0 alpha:.5];
    
    //
    CGFloat labelX = imageX;
    CGFloat labelY = imageH;
    CGFloat labelW = imageW;
    CGFloat labelH = self.bounds.size.height - imageH;
    
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    self.titleLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:.5];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}

- (void)setHighlighted:(BOOL)highlighted {

}

//- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//
//}

//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//
//}


@end


