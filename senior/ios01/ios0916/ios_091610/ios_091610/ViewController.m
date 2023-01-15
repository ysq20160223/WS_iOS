//
//  ViewController.m
//  ios_091610
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *v;

@property (nonatomic, assign) NSInteger i;

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_i++ % 2 == 0) {
        XLog
        [self caBasicAnim];
    } else {
        XLog
        [self caAnimationGroup];
    }
}

- (void)caAnimationGroup {
    int duration = 2;
    
    // 缩放
    CABasicAnimation *scaleAnim = CABasicAnimation.animation;
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.toValue = @2;
    scaleAnim.duration = duration;
    
    // 平移
    CABasicAnimation *positionAnim = CABasicAnimation.animation;
    positionAnim.keyPath = @"position.y";
    positionAnim.toValue = @(0);
    positionAnim.duration = duration;
    
    CAAnimationGroup *group = CAAnimationGroup.animation;
    group.animations = @[scaleAnim, positionAnim];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    [self.v.layer addAnimation:group forKey:nil]; // 添加动画
}

- (void)caBasicAnim {
    int duration = 1;
    
    // 缩放
    CABasicAnimation *scaleAnim = CABasicAnimation.animation;
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.toValue = @.5;
    scaleAnim.duration = duration;
    scaleAnim.removedOnCompletion = NO;
    scaleAnim.fillMode = kCAFillModeForwards;
    [self.v.layer addAnimation:scaleAnim forKey:nil];
    
    // 平移
    CABasicAnimation *positionAnim = CABasicAnimation.animation;
    positionAnim.keyPath = @"position.y";
    positionAnim.toValue = @(400);
    positionAnim.duration = duration;
    positionAnim.removedOnCompletion = NO;
    positionAnim.fillMode = kCAFillModeForwards;
    [self.v.layer addAnimation:positionAnim forKey:nil];
}

@end


