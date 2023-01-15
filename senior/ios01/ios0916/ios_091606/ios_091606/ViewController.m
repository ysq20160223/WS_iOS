//
//  ViewController.m
//  ios_091606
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *v;

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1, 创建对象
    CABasicAnimation *anim = CABasicAnimation.animation;
    
    // 2, 设置属性
    anim.keyPath = @"transform.scale";
    anim.toValue = @.5;
    anim.duration = 3;
    anim.removedOnCompletion = NO; // 动画完成时不要删除动画
//    anim.fillMode = @"forwards";
    anim.fillMode = kCAFillModeForwards;
    
    // 3, 添加动画
    [self.v.layer addAnimation:anim forKey:nil];
}

@end


