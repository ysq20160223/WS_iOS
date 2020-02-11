//
//  BaseView.m
//  ios_07
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    如果父控件不能接收触摸事件, 那么子控件就不可能接收到触摸事件
 
    是否允许用户交互 userInteractionEnabled
    透明度 alpha
    是否隐藏 hidden
 
    如何找到最合适的控件来处理事件
        自己是否接收触摸事件
        触摸点是否在自己身上
        从后往前遍历子控件, 重复前面的两个步骤
        如果没有符合条件的子控件, 那么就自己最合适处理
 
 */

#import "BaseView.h"

@implementation BaseView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", [self class]);
    
}

@end


