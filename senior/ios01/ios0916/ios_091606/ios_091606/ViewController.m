//
//  ViewController.m
//  ios_091606
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1, 创建对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2, 设置属性
    anim.keyPath = @"transform.scale";
    anim.toValue = @.5;
    anim.duration = 3;
    
    // 动画完成时不要删除动画
    anim.removedOnCompletion = NO;
//    anim.fillMode = @"forwards";
    anim.fillMode = kCAFillModeForwards;
    
    // 3, 添加动画
    [self.myView.layer addAnimation:anim forKey:nil];
}

@end


