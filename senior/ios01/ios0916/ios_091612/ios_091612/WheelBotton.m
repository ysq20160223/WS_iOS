//
//  WheelBotton.m
//  ios_091612
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "WheelBotton.h"

@implementation WheelBotton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat w = 44;
    CGFloat h = 50;
    CGFloat x = (contentRect.size.width - w) * .5;
    CGFloat y = 20;
    
    return CGRectMake(x, y, w, h);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}


@end


