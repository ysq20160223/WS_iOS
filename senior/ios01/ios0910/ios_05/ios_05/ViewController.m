//
//  ViewController.m
//  ios_05
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

- (IBAction)modal:(UIButton *)sender;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)modal:(UIButton *)sender {
    NSLog(@"");
    UIViewController *vc = [[OneViewController alloc] init];
    vc.view.backgroundColor = [UIColor cyanColor];
    
    // 把控制器的 view 添加到窗口上, 而且动画从下到上
//    // 1, 获取窗口
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    [keyWindow addSubview:vc.view];
//
//    vc.view.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height); // 平移
//    
//    // 2
//    [UIView animateWithDuration:.25 animations:^{
//        vc.view.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        [self.view removeFromSuperview];
//    }];
    
    
    // 1, modal 出来的控制器的 view 添加到窗口上, 唯一不确定, modal 处理的控制器需不需要被强引用
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"parentViewController: %@", self.parentViewController)
    }];
}

- (IBAction)push:(UIButton *)sender {
    NSLog(@"");
    UIViewController *vc = [[TwoViewController alloc] init];
    vc.view.backgroundColor = [UIColor magentaColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end



