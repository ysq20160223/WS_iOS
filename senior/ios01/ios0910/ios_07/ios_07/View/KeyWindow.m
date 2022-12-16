//
//  KeyWindow.m
//  ios_07
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    
 */

#import "KeyWindow.h"

@implementation KeyWindow

// 寻找最合适的 view
// 只要一个事件传递给一个控件, 就会调用这个控件的 hitTest
// point : 表示方法调用者坐标系上的点
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    XLog
//    UIView *fitView = [super hitTest:point withEvent:event];
//    NSLog(@"%@", fitView);
    
    // 1, 判断 自己能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= .01) {
        return nil;
    }
    
    // 2, 判断 点在不在当前控件上
    if ([self pointInside:point withEvent:event] == NO) {
        return nil;
    }
    
    // 3, 从后往前遍历自己的子控件
    long count = self.subviews.count;
    for (long i = count - 1; i >= 0; i--) {
        // 获取子控件
        UIView *childView = self.subviews[i];
        
        // 把当前坐标系上的点转换成子控件上的点
        CGPoint childP = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childP withEvent:event];
        if (fitView) {
            return fitView;
        }
    }
    

    
    // 4, 如果没有比自己合适的子控件, 最合适的 view 就是自己
    return self;
}

// 判断下当前这个点在不在方法调用者上
// 使用注意点, 点必须是方法调用者上的坐标系, 才会判断准确
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ - touchesBegan ", self.class);
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


