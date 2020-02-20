//
//  ViewController.m
//  ios_091610
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self caBasicAnim];
    
//    [self caAnimationGroup];
}

- (void)caAnimationGroup {
    // 缩放
    CABasicAnimation *scaleAnim = [CABasicAnimation animation];
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.toValue = @.5;
    
    // 平移
    CABasicAnimation *translationAnim = [CABasicAnimation animation];
    translationAnim.keyPath = @"position.y";
    translationAnim.toValue = @(400);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scaleAnim, translationAnim];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    [self.myView.layer addAnimation:group forKey:nil]; // 添加动画
}

- (void)caBasicAnim {
    // 缩放
    CABasicAnimation *scaleAnim = [CABasicAnimation animation];
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.toValue = @.5;
    scaleAnim.removedOnCompletion = NO;
    scaleAnim.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:scaleAnim forKey:nil];
    
    // 平移
    CABasicAnimation *translationAnim = [CABasicAnimation animation];
    translationAnim.keyPath = @"position.y";
    translationAnim.toValue = @(400);
    translationAnim.removedOnCompletion = NO;
    translationAnim.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:translationAnim forKey:nil];
}

@end


