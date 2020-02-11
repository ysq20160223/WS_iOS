//
//  UpView.m
//  ios_10
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UpView.h"

@interface UpView ()

@property (nonatomic, weak) IBOutlet UIButton *btn;

@end





@implementation UpView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan - %@", [self class]);
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 判断点在不在按钮上
    
    // 转换坐标系
    CGPoint btnP = [self convertPoint:point toView:self.btn];
    NSLog(@"x: %f, y: %f", btnP.x, btnP.y);
    
    // 获取按钮
    if ([self.btn pointInside:btnP withEvent:event]) {
        return self.btn;
    }
    
    return [super hitTest:point withEvent:event];
}

@end


