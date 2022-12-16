//
//  PopButton.m
//  ios_11
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PopButton.h"

@implementation PopButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 判断下点在不在 dialogView 上
    CGPoint dialogP =  [self convertPoint:point toView:self.btnDialogView];
    if ([self.btnDialogView pointInside:dialogP withEvent:event] == YES) {
        return self.btnDialogView;
    } else {
        return [super hitTest:point withEvent:event];
    }
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取 UITouch
    UITouch *touch = [touches anyObject];
    
    // 获取当前点
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    
    // 让按钮随着手指移动而移动
    // 获取手指的偏移量
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    
    // 移动按钮
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


