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
    
    NSLog(@"topImageView.frame: %@", NSStringFromCGRect(self.topImageView.frame));
    self.topImageView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    self.bottomImageView.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    
    self.topImageView.layer.anchorPoint = CGPointMake(0.5, 1);
    self.bottomImageView.layer.anchorPoint = CGPointMake(0.5, 0);
    
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
    // 让上半部分图片旋转
    CGPoint panPoint = [pan translationInView:self.dragView];
    
    
    //
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 550.0; // 立体效果, 近大远小
    
    CGFloat angle = panPoint.y * M_PI / 256;
    NSLog(@"point: %@, angle: %f", NSStringFromCGPoint(panPoint), angle);
    
    self.topImageView.layer.transform = CATransform3DRotate(transform ,-angle, 1, 0, 0);
    
    self.gradient.opacity = panPoint.y / 256.0; // 设置不透明度
    if (angle > 2.8) {
        self.gradient.opacity = 0;
    }
    
    //
    if (pan.state == UIGestureRecognizerStateEnded) {
        // 让上个图片反弹的动画
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.topImageView.layer.transform = CATransform3DIdentity;
            self.gradient.opacity = 0;
        } completion:^(BOOL finished) {
            
        }];
    }
}


@end


