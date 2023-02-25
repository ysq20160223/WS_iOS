//
//  XCover.m
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XCover.h"

@implementation XCover

+ (void)hide {
    for (UIView *childView in UIApplication.sharedApplication.keyWindow.subviews) {
//        NSLog(@"%@", childView);
        
//        if ([childView isKindOfClass:self]) {
//            [UIView animateWithDuration:1 animations:^{
//                childView.alpha = 0;
//            } completion:^(BOOL finished) {
//                [childView removeFromSuperview];
//            }];
//        }
        
        if ([childView isKindOfClass:self]) {
            [UIView animateWithDuration:1 animations:^{
                childView.alpha = 0;
            } completion:^(BOOL finished) {
                [childView removeFromSuperview];
            }];
        }
    }
}

+ (void)show {
    XCover *cover = [XCover.alloc initWithFrame:UIScreen.mainScreen.bounds];
    cover.backgroundColor = UIColor.clearColor;
    cover.alpha = .1; // 设置父控件透明度会影响子控件
    [UIApplication.sharedApplication.keyWindow addSubview:cover];
    [UIView animateWithDuration:1 animations:^{
        cover.backgroundColor = UIColor.blackColor;
        cover.alpha = .6;
    }];
}

@end


