//
//  MyPopMenu.m
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyPopMenu.h"

@implementation MyPopMenu

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
- (void)hideInPoint:(CGPoint)point completion:(void (^ __nullable)())completion {
    [UIView animateWithDuration:1 animations:^{
        self.center = point;
        self.transform = CGAffineTransformMakeScale(.01, .01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview]; // 移除
        completion(); // 隐藏蒙版
    }];
    
}

//
+ (instancetype)showInPoint:(CGPoint)point {
    // 创建菜单
    MyPopMenu *popMenu = [[NSBundle mainBundle] loadNibNamed:@"MyPopMenu" owner:nil options:nil][0];
    popMenu.backgroundColor = [UIColor cyanColor];
    
//    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
//    popMenu.center = CGPointMake(screenW * .5, screenH * .5);
    
    popMenu.center = point;
    
    [[UIApplication sharedApplication].keyWindow addSubview:popMenu];
    
    return popMenu;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


