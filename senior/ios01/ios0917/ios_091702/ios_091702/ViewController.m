//
//  ViewController.m
//  ios_091702
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@property (weak, nonatomic) IBOutlet UIView *dragView;

@property (weak, nonatomic) IBOutlet CAGradientLayer *gradient;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.topImageView.layer.contentsRect = CGRectMake(0, 0, 1, .5);
    self.bottomImageView.layer.contentsRect = CGRectMake(0, .5, 1, .5);
    
    self.topImageView.layer.anchorPoint = CGPointMake(.5, 1);
    self.bottomImageView.layer.anchorPoint = CGPointMake(.5, 0);
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.dragView addGestureRecognizer:pan];
    
    
    // 给底部图片添加渐变
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.bottomImageView.bounds;
    gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor blackColor].CGColor];
    
    gradient.opacity = 0; // 完全透明
    
    _gradient = gradient;
    
    [self.bottomImageView.layer addSublayer:gradient];
    
}

//- (void)gradient {
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    
//    gradient.frame = self.bottomImageView.bounds;
//    gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor blackColor].CGColor];
//    
//    gradient.startPoint = CGPointMake(0, 0); // 设置渐变的方向
//    gradient.endPoint = CGPointMake(1, 0);
//    
//    [self.bottomImageView.layer addSublayer:gradient];
//}

- (void)pan:(UIPanGestureRecognizer *)pan {
    //
    
    // 让上半部分图片旋转
    CGPoint transP = [pan translationInView:self.dragView];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 500.0;
    
    CGFloat angle = transP.y * M_PI / 200; // 立体的效果, 近大远小
    
    self.gradient.opacity = transP.y / 256.0; // 设置不透明度
    
    self.topImageView.layer.transform = CATransform3DRotate(transform ,-angle, 1, 0, 0);
    
    //
    if (pan.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.35 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            // 让上个图片反弹
            self.topImageView.layer.transform = CATransform3DIdentity;
            self.gradient.opacity = 0;
        } completion:^(BOOL finished) {
            
        }];
    }
}


@end


