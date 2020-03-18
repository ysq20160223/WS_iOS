//
//  EssenceNavController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "EssenceViewController.h"

@interface EssenceViewController ()

@end



@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XLog
    self.view.backgroundColor = XColor(0x00, 0x88, 0xff);
//    self.navigationItem.title = @"essence";
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *navItemLeftBtnView = [[UIButton alloc] init];
    [navItemLeftBtnView setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [navItemLeftBtnView setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [navItemLeftBtnView sizeToFit];
    [navItemLeftBtnView addTarget:self action:@selector(navItemLeftBtnViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navItemLeftBtnView];
    
}

- (void)navItemLeftBtnViewClick:(UIButton *)btn {
    NSLog(@"btn: %@", btn);
    
}

@end


