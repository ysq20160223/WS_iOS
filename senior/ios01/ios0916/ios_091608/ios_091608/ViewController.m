//
//  ViewController.m
//  ios_091608
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self iconShake];
    
    [self iconPath];
}

- (void)iconPath {
    // 创建帧动画
    CAKeyframeAnimation *anim = CAKeyframeAnimation.animation;
    
    // 设置属性
    anim.keyPath = @"position";
    
    //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 200, 200)]; // 圆
    
    // 路径
    UIBezierPath *path = UIBezierPath.bezierPath;
    [path moveToPoint:CGPointMake(self.iv.layer.position.x, self.iv.layer.position.y)];
    [path addLineToPoint:CGPointMake(self.iv.frame.size.width * 0.5, UIApplication.sharedApplication.statusBarFrame.size.height + self.iv.frame.size.height * 0.5)];
    
    anim.path = path.CGPath;
    anim.duration = 5;
    anim.repeatCount = MAXFLOAT;
    anim.autoreverses = YES;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.iv.layer addAnimation:anim forKey:nil];
    
}

- (void)iconShake {
    // 创建帧动画
    CAKeyframeAnimation *anim = CAKeyframeAnimation.animation;
    
    // 设置属性
    anim.keyPath = @"transform.rotation";
    anim.repeatCount = MAXFLOAT;
    
    // 1
    anim.duration = .15;
    anim.values = @[@(angle2Radian(-6)), @(angle2Radian(6))];
    anim.autoreverses = YES;
    
    // 2
    //    anim.duration = 1;
    //    anim.values = @[@(angle2Rad(-30)), @(angle2Rad(30)), @(angle2Rad(-30))];
    
    [self.iv.layer addAnimation:anim forKey:nil];
}


@end


