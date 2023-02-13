//
//  ViewController.m
//  ios_091705
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end



@implementation ViewController

- (void)repLayer {
    // 复制层
    CAReplicatorLayer *repLayer = CAReplicatorLayer.layer;
    
    repLayer.frame = self.contentView.bounds;
    repLayer.instanceCount = 3;
    repLayer.instanceDelay = 0.6;
    repLayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0);
    
    [self.contentView.layer addSublayer:repLayer];
    
    // 创建一个音乐震动条
    CALayer *layer = CALayer.layer;
    [repLayer addSublayer:layer];
    
    CGFloat w = 30;
    CGFloat h = 100;
    layer.bounds = CGRectMake(0, 0, w, h);
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.contentView.bounds.size.height);
    
    // 添加动画
    CABasicAnimation *anim = CABasicAnimation.animation;
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.duration = 0.5;
    anim.repeatCount = MAXFLOAT;
    anim.autoreverses = YES;

    [layer addAnimation:anim forKey:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self repLayer];
    
    [self singleLayer];
}

- (void)singleLayer {
    CALayer *layer = CALayer.layer;
    [self.contentView.layer addSublayer:layer];
    
    CGFloat w = 30;
    CGFloat h = 100;
    layer.bounds = CGRectMake(0, 0, w, h);
    layer.backgroundColor = UIColor.magentaColor.CGColor;
    layer.position = CGPointMake(self.contentView.bounds.size.width - w, self.contentView.bounds.size.height);
    layer.anchorPoint = CGPointMake(0, 1);
//    NSLog(@"anchorPoint: %@", NSStringFromCGPoint(layer.anchorPoint));
    
    CABasicAnimation *anim = CABasicAnimation.animation;
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.duration = 0.5;
    anim.repeatCount = MAXFLOAT;
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
}

@end


