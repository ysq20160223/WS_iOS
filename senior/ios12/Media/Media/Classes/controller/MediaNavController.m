//
//  MediaNavController.m
//  Media
//
//  Created by Apple on 2022/9/2.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "MediaNavController.h"

@interface MediaNavController () <UIGestureRecognizerDelegate>

@end



@implementation MediaNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    
//    self.navigationBar.hidden = YES;
    // 设置背景颜色, 防止push的时候右上角出现黑边
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"my_top_bgs"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setBackgroundColor:[UIColor cyanColor]]; // 设置颜色无效
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    NSLog(@"%@", viewController.class);
    
    if (self.childViewControllers.count > 0) {
        NSInteger navigationH = self.navigationBar.frame.size.height;
        UIButton *backBtn = [UIButton.alloc initWithFrame:CGRectMake(0, 0, navigationH, navigationH)];
//        backBtn.backgroundColor = UIColor.cyanColor;
        [backBtn setImage:[UIImage imageNamed:@"head_icon_arrow_left"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"head_icon_arrow_left"] forState:UIControlStateHighlighted];
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -21, 0, 0)];
//        [backBtn setTitle:@"Back" forState:UIControlStateNormal];
//        [backBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
//        [backBtn setTitleColor:XColor(237, 77, 61) forState:UIControlStateHighlighted];
//        [backBtn sizeToFit];
        
//        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        if ([viewController respondsToSelector:@selector(back)]) {
            [backBtn addTarget:viewController action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        } else {
            [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        UIView *leftView = [UIView.alloc initWithFrame:CGRectMake(0, 0, navigationH, navigationH)];
//        leftView.backgroundColor = UIColor.magentaColor;
        [leftView addSubview:backBtn];
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:leftView];
        viewController.hidesBottomBarWhenPushed = true; // 隐藏底部TabBar
    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)back {
    [self popViewControllerAnimated:YES];
}

#pragma mark -
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1;
}


@end


