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

static int _i = 0;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //
    [self caTransition];
    
    //
//    [UIView transitionWithView:self.imageView duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
//        _i++;
//
//        NSString *imageName = [NSString stringWithFormat:@"%d.png", _i % 3];
//        self.imageView.image = [UIImage imageNamed:imageName];
//    } completion:nil];
}

// 转场代码必须得要和转场动画在同一个方法当中
- (void)caTransition {
    
    // 转场代码
    NSString *imageName = [NSString stringWithFormat:@"%d.png", ++_i % 3];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    // 转场动画
    CATransition *anim = [CATransition animation]; // 创建动画
    
    
    // fade push moveIn reveal cube oglFlip suckEffect rippleEffect pageCurl pageUnCurl
    // cameraIrisHollowOpen cameraIrisHollowClose
    
//    anim.type = @"pageUnCurl";
    anim.type = @"pageCurl";
    
    anim.subtype = kCATransitionFromTop; // 设置转场方向
    anim.startProgress = .1;
    anim.endProgress = .9;
    
    //
//    anim.type = @"fade";
//    anim.type = @"push";
//    anim.type = @"moveIn";
//    anim.type = @"reveal";
//    anim.type = @"cube";
//    anim.type = @"oglFlip";
    
//    anim.type = @"suckEffect";
//    anim.type = @"rippleEffect";
    
    anim.duration = 1;
    [self.imageView.layer addAnimation:anim forKey:nil];
}

@end


