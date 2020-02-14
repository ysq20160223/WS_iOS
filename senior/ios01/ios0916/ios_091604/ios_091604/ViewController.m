//
//  ViewController.m
//  ios_091604
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    每一个UIView内部都默认都关联着一个 CALayer, 称这个Layer为RootLayer
    所有的非 Root Layer, 也就是手动创建的 CALayer对象, 都存在着隐式动画
 
    什么是隐式动画
        当对非 Root Layer 的部分属性进行修改时, 默认会自动产生一些动画效果
        而这些属性称为 Animatable Properties(可动画属性)
 
    几个常见的 Animatable Properties : 
        bounds : 用于设置 CALayer 的宽度和高度
        backgroundColor : 用于设置 CALayer 的背景色
        position : 用于设置 CALayer 的位置
 */

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer *layer;

//
@property (weak, nonatomic) IBOutlet UIView *myView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 非根 Layout
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    self.layer = layer;
    
    [self.view.layer addSublayer:layer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [CATransaction begin];
    
    [CATransaction setDisableActions:NO]; // 设置事务有没有动画
    [CATransaction setAnimationDuration:3]; // 设置事务动画的执行时长
    
    self.layer.bounds = CGRectMake(0, 0, arc4random_uniform(150), arc4random_uniform(150)); // 缩放比例
    self.layer.position = CGPointMake(arc4random_uniform(150), arc4random_uniform(150));
    self.layer.backgroundColor = [self randomColor].CGColor;
    
    self.layer.cornerRadius = arc4random_uniform(35);
    
    [CATransaction commit];
    
    // UIView 根
//    self.myView.layer.position = CGPointMake(300, 300);
    
}

- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


@end


