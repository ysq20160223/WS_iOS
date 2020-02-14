//
//  MyCover.m
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyCover.h"

@implementation MyCover

+ (void)hide {
    for (UIView *childView in [UIApplication sharedApplication].keyWindow.subviews) {
//        NSLog(@"%@", childView);
        
//        if ([childView isKindOfClass:self]) {
//            [UIView animateWithDuration:1 animations:^{
//                childView.alpha = 0;
//            } completion:^(BOOL finished) {
//                [childView removeFromSuperview];
//            }];
//        }
        
        if ([childView isKindOfClass:self]) {
            childView.alpha = 0;
            [childView removeFromSuperview];
        }
        
        
    }
}

+ (void)show {
    MyCover *cover = [[MyCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = .6; // 设置父控件透明度会影响子控件
    
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}

@end


