//
//  ViewController.m
//  ios_091608
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self iconShake];
    
    
    // 创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 设置属性
    anim.keyPath = @"position";
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 200, 200)]; // 圆
    
    // 路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(50, 500)];
    
    anim.path = path.CGPath;
    
    anim.repeatCount = MAXFLOAT;
    anim.duration = 1;
    anim.autoreverses = YES;
    
    [self.icon.layer addAnimation:anim forKey:nil];
    
}

- (void)iconShake {
    // 创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 设置属性
    anim.keyPath = @"transform.rotation";
    
    anim.repeatCount = MAXFLOAT;
    
    // 1
    anim.duration = .5;
    anim.values = @[@(angle2Rad(-30)), @(angle2Rad(30))];
    anim.autoreverses = YES;
    
    // 2
    //    anim.duration = 1;
    //    anim.values = @[@(angle2Rad(-30)), @(angle2Rad(30)), @(angle2Rad(-30))];
    
    [self.icon.layer addAnimation:anim forKey:nil];
    
}


@end





