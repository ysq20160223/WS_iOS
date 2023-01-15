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
    NSString *imageName = [NSString stringWithFormat:@"%d.png", _i % 3];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    
    //    anim.type = @"fade";
    //    anim.type = @"push";
    //    anim.type = @"moveIn";
    //    anim.type = @"reveal";
    //    anim.type = @"cube";
    //    anim.type = @"oglFlip";
        
    //    anim.type = @"suckEffect";
    //    anim.type = @"rippleEffect";
    
    
    // 转场动画
    CATransition *anim = CATransition.animation; // 创建动画
    NSArray *typeArray = @[@"fade", @"push", @"moveIn", @"reveal", @"cube", @"oglFlip", @"suckEffect", @"rippleEffect"];
    anim.type = typeArray[_i % typeArray.count];
    NSLog(@"%d; type; %lu; %@", _i, _i % typeArray.count, typeArray[_i % typeArray.count]);
    
    
    NSArray *subtypeArray = @[kCATransitionFromRight, kCATransitionFromLeft, kCATransitionFromTop, kCATransitionFromBottom];
//    anim.subtype = subtypeArray[_i % subtypeArray.count]; // 设置转场方向
//    NSLog(@"subtype; %lu; %@", _i % subtypeArray.count, subtypeArray[_i % subtypeArray.count]);
    
//    anim.startProgress = .1;
//    anim.endProgress = .9;
    
    
    anim.duration = 1;
    [self.imageView.layer addAnimation:anim forKey:nil];
    _i++;
}

@end


