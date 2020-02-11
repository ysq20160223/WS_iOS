//
//  MyView.m
//  ios_06
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyView.h"

@implementation MyView

// 开始触摸
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%@", touches);
    NSLog(@"");
    
    
}

// 移动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"");
    
    // 让当前控件随着手指的移动而移动
    
    // 获取 UITouch
    UITouch *touch = [touches anyObject];
    
    // 获取当前点
    CGPoint curP = [touch locationInView:self];
    
    // 获取上一个点
    CGPoint prep = [touch previousLocationInView:self];
    
    // 计算手指 x 轴偏移量
    CGFloat offsetX = curP.x - prep.x;
    CGFloat offsetY = curP.y - prep.y;
    
    // 修改控件的形变
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

//// 离开当前 view
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __func__);
//    
//    
//}


@end


