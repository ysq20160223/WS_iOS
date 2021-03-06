//
//  VCView.m
//  ios_091707
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VCView.h"

@interface VCView ()

@property (strong, nonatomic) UIBezierPath *path;

@property (strong, nonatomic) CALayer *dotLayer;

//
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *reDrawBtn;

@end



@implementation VCView

+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

- (void)play {
    // 添加动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 3;
    
    [self.dotLayer addAnimation:anim forKey:nil];
    
    //
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 3;
    repL.instanceDelay = .55;
    
//    self.playBtn.enabled = NO;
}

- (void)reDraw {
    // 清空路径
    [self.path removeAllPoints];
    [self setNeedsDisplay];
    
    [self.dotLayer removeAllAnimations]; // 移除动画
    
    self.playBtn.enabled = NO;
    self.reDrawBtn.enabled = NO;
}

//
-(void)awakeFromNib {
    [super awakeFromNib];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    
    // 创建粒子
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(0, 0, 20, 20);
    dotLayer.backgroundColor = [UIColor cyanColor].CGColor;
    
    self.dotLayer = dotLayer;
    [self.layer addSublayer:dotLayer];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint curPoint = [pan locationInView:self];
    
    if(pan.state == UIGestureRecognizerStateBegan) {
        [self.path moveToPoint:curPoint];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:curPoint];
        
        [self setNeedsDisplay]; // 重绘
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        self.playBtn.enabled = ~[self.path isEmpty];
        self.reDrawBtn.enabled = ~[self.path isEmpty];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.path stroke];
}

@end


