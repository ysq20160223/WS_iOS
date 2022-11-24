//
//  ViewController.m
//  ios_03
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *cyanView;

- (IBAction)translation:(id)sender;
- (IBAction)rotation:(id)sender;
- (IBAction)scale:(UIButton *)sender;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // transform : 所有的控件都有 transform (平移, 旋转, 缩放)
}



- (IBAction)translation:(id)sender {
    [UIView animateWithDuration:2 animations:^{
//        CGRect frame = _cyanView.frame;
//        frame.origin.x += 200;
//        _cyanView.frame = frame;
        
        // 相对于最开始的位置平移
//        _cyanView.transform = CGAffineTransformMakeTranslation(100, 0);
        
        // 相对于上一次形变
        _cyanView.transform = CGAffineTransformTranslate(_cyanView.transform, 50, 0);
        
    }];
}

- (IBAction)rotation:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        // 相对于初始位置
//        _cyanView.transform = CGAffineTransformMakeRotation(45);
        
        // 现对于上次
        _cyanView.transform = CGAffineTransformRotate(_cyanView.transform, +M_PI_4);
    }];
}

- (IBAction)scale:(UIButton *)sender {
    [UIView animateWithDuration:2 animations:^{
//        _cyanView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        _cyanView.transform = CGAffineTransformScale(_cyanView.transform, 1.2, 1.2);
    }];     
}

@end


