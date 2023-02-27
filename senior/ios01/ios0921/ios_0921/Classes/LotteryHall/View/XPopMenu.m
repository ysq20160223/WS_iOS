//
//  XPopMenu.m
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XPopMenu.h"

@implementation XPopMenu

// 点击关闭按钮
- (IBAction)alphaClose:(UIButton *)sender {
//    NSLog(@"%s", __func__);
    // 平移 + 动画
    // 通知代理, 移除蒙版
    if ([_delegate respondsToSelector:@selector(popMenuDidClickClose:)]) {
        [_delegate popMenuDidClickClose:self];
    }
}

//
- (void)hideInPoint:(CGPoint)point completion:(void (^ __nullable)(void))completion {
    completion(); // 隐藏蒙版
    [UIView animateWithDuration:1 animations:^{
        self.center = point;
        self.transform = CGAffineTransformMakeScale(.01, .01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview]; // 移除
//        completion(); // 隐藏蒙版
    }];
}

//
+ (instancetype)showInPoint:(CGPoint)point {
    // 创建菜单
    XPopMenu *popMenu = [NSBundle.mainBundle loadNibNamed:[NSString stringWithFormat:@"%@", self.class] owner:nil options:nil].firstObject;
//    popMenu.center = point;
    popMenu.center = CGPointMake(44, kStatusBarH + 22);
    popMenu.transform = CGAffineTransformMakeScale(.01, .01);
    [UIView animateWithDuration:1 animations:^{
        popMenu.backgroundColor = UIColor.cyanColor;
        popMenu.transform = CGAffineTransformMakeScale(1, 1);
        popMenu.center = point;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIApplication.sharedApplication.keyWindow addSubview:popMenu];
    
    return popMenu;
}

@end


