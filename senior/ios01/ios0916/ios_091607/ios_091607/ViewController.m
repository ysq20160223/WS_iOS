//
//  ViewController.m
//  ios_091607
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivHeart;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1, 创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2, 设置属性
    anim.keyPath = @"transform.scale";
    anim.toValue = @0.5;
    
    anim.repeatCount = MAXFLOAT;
    anim.duration = .5;
    anim.autoreverses = YES;
    
    // 3, 添加动画
    [self.ivHeart.layer addAnimation:anim forKey:nil];
    
}

@end


