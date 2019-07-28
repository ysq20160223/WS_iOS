//
//  ViewController.m
//  ios_020201
//
//  Created by Apple on 2017/7/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)btnClickWithBlock:(void (^)())block {
    [UIView beginAnimations:nil context:nil]; // 0, 动画 (头部, 开始动画)
    [UIView setAnimationDuration:0.3]; // 设置执行动画时间
    
    block();
    
    [UIView commitAnimations]; // 4, 动画 (尾部 - 提交动画 - 执行动画)
}

#pragma mark -- 上下左右位移
- (IBAction)direction:(id)sender {
//    NSLog(@"up");
    
    // oc 不允许直接修改 某个对象中结构体属性的成员
    
    [self btnClickWithBlock:^{
        CGFloat delta = 100;
        
        // 1, 先取出frame
//        CGRect frame = _btnIcon.frame; // 结构体赋值 是 成员的赋值
        CGPoint center = _btnIcon.center; // 020212
        
        switch ([sender tag]) {
            case 1:
//                frame.origin.x -= delta; // 2, 修改值
                center.x -= delta;
                break;
                
            case 2:
//                frame.origin.y -= delta;
                center.y -= delta;
                break;
                
            case 3:
//                frame.origin.x += delta;
                center.x += delta;
                break;
                
            case 4:
//                frame.origin.y += delta;
                center.y += delta;
                break;
        }
//        _btnIcon.frame = frame; // 3, 重新赋值
        _btnIcon.center = center;
    }];
}

#pragma mark -- 左右旋转
- (IBAction)transformRotate:(id)sender {
    [self btnClickWithBlock:^{
        switch ([sender tag]) {
            case 5:
                _btnIcon.transform = CGAffineTransformRotate(_btnIcon.transform, -M_PI_4);
                break;
                
            case 6:
                _btnIcon.transform = CGAffineTransformRotate(_btnIcon.transform, +M_PI_4);
                break;
        }
    }];
}

#pragma mark -- 放大缩小
- (IBAction)transformScale:(id)sender {
    [self btnClickWithBlock:^{
        switch ([sender tag]) {
            case 7:
                _btnIcon.transform = CGAffineTransformScale(_btnIcon.transform, 0.5, 0.5);
                break;
                
            case 8:
                _btnIcon.transform = CGAffineTransformScale(_btnIcon.transform, 2, 2);
                break;
        }
    }];
}

#pragma mark -- 重置
- (IBAction)iconIdentity:(id)sender {
    [self btnClickWithBlock:^{
        _btnIcon.transform = CGAffineTransformIdentity; // 重置所有状态
    }];
}

@end





