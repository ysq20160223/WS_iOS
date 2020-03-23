//
//  XNavController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "XNavController.h"

@interface XNavController () <UIGestureRecognizerDelegate>

@end



@implementation XNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    // 设置背景颜色, 防止push的时候右上角出现黑边
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setBackgroundColor:[UIColor cyanColor]]; // 设置颜色无效
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"%@", viewController.class);
    
    if (self.childViewControllers.count > 0) {
        UIButton *backBtn = [[UIButton alloc] init];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        [backBtn setTitle:@"Back" forState:UIControlStateNormal];
//        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [backBtn setTitleColor:XColor(237, 77, 61) forState:UIControlStateHighlighted];
        [backBtn sizeToFit];
        
        
//        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
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

#pragma mark -
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDarkContent;
}

@end


