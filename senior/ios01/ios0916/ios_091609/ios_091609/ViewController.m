//
//  ViewController.m
//  ios_091609
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

static int _i = 1;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView transitionWithView:self.imageView duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        _i++;
        if (_i > 3) {
            _i = 1;
        }
        NSString *imageName = [NSString stringWithFormat:@"%d.png", _i];
        self.imageView.image = [UIImage imageNamed:imageName];
    } completion:nil];
    
}

// 转场代码必须得要和转场动画在同一个方法当中
- (void)caTransition {
    _i++;
    if (_i > 3) {
        _i = 1;
    }
    NSString *imageName = [NSString stringWithFormat:@"%d.png", _i];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    CATransition *anim = [CATransition animation]; // 创建动画
    
    anim.type = @"pageCurl";
    // fade push moveIn reveal cube oglFlip suckEffect rippleEffect pageCurl pageUnCurl
    // cameraIrisHollowOpen cameraIrisHollowClose
    
    anim.subtype = kCATransitionFromTop; // 设置转场方向
    
    anim.startProgress = .1;
    anim.endProgress = .9;
    
    anim.duration = 1;
    [self.imageView.layer addAnimation:anim forKey:nil];
}

@end



