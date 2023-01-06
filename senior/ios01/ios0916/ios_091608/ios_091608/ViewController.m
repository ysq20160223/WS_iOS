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

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"statusH: %f", UIApplication.sharedApplication.statusBarFrame.size.height);
    
    [self iconShake];
    
//    [self iconPath];
}

- (void)iconPath {
    // 创建帧动画
    CAKeyframeAnimation *anim = CAKeyframeAnimation.animation;
    
    // 设置属性
    anim.keyPath = @"position";
    
    //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 200, 200)]; // 圆
    
    // 路径
    UIBezierPath *path = UIBezierPath.bezierPath;
    
    [path moveToPoint:CGPointMake(self.icon.layer.position.x, self.icon.layer.position.y)];
    [path addLineToPoint:CGPointMake(self.icon.frame.size.width * 0.5, [UIApplication sharedApplication].statusBarFrame.size.height + self.icon.frame.size.height * 0.5)];
    
    anim.path = path.CGPath;
    
    anim.duration = 3;
    
    //
    //    anim.repeatCount = MAXFLOAT;
    //    anim.autoreverses = YES;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.icon.layer addAnimation:anim forKey:nil];
    
}

- (void)iconShake {
    // 创建帧动画
    CAKeyframeAnimation *anim = CAKeyframeAnimation.animation;
    
    // 设置属性
    anim.keyPath = @"transform.rotation";
    
    anim.repeatCount = MAXFLOAT;
    
    // 1
    anim.duration = .5;
    anim.values = @[@(angle2Radian(-30)), @(angle2Radian(30))];
    anim.autoreverses = YES;
    
    // 2
    //    anim.duration = 1;
    //    anim.values = @[@(angle2Rad(-30)), @(angle2Rad(30)), @(angle2Rad(-30))];
    
    [self.icon.layer addAnimation:anim forKey:nil];
}


@end


