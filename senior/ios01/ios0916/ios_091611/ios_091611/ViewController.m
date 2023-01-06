//
//  ViewController.m
//  ios_091611
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    UIView动画 和 核心动画的区别
        1, 核心动画只作用在layer
        2, 核心动画修改的值都是假象, 真实的位置没有发生变化
 
    当需要与用户进行交互的时候用UIView
    
    适合用核心动画
        1, 转场动画
        2, 帧动画
        3, 动画组
 */

#import "ViewController.h"

#import "MyView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet MyView *myView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", NSStringFromCGRect(self.myView.frame));
}

//
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [UIView animateWithDuration:5 animations:^{
////        self.myView.transform = CGAffineTransformMakeTranslation(0, 200);
////        self.myView.transform = CGAffineTransformMakeScale(0.5, 0.5);
//        NSLog(@"%@", NSStringFromCGRect(self.myView.frame));
//    }];
    
    [UIView animateWithDuration:2 animations:^{
        self.myView.transform = CGAffineTransformTranslate(self.myView.transform, 0, 100);
        NSLog(@"%@", NSStringFromCGRect(self.myView.frame));
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            self.myView.transform = CGAffineTransformScale(self.myView.transform, 0.8, 0.8);
            NSLog(@"%@", NSStringFromCGRect(self.myView.frame));
        }];
    }];
    
    //
//    CABasicAnimation *animPosition = [CABasicAnimation animation];
//    animPosition.keyPath = @"position.y";
//    animPosition.toValue = @(500);
//    animPosition.removedOnCompletion = NO;
//    animPosition.fillMode = kCAFillModeForwards;
//    [self.myView.layer addAnimation:animPosition forKey:nil];
//
//    CABasicAnimation *animScale = [CABasicAnimation animation];
//    animScale.keyPath = @"transform.scale";
//    animScale.toValue = @.5;
//    animScale.removedOnCompletion = NO;
//    animScale.fillMode = kCAFillModeForwards;
//    [self.myView.layer addAnimation:animScale forKey:nil];
//
//    NSLog(@"%@", NSStringFromCGRect(self.myView.frame));
}

@end


