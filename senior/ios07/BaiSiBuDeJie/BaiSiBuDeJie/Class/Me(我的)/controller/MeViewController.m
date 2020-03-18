//
//  MeNavController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end



@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XLog
    self.view.backgroundColor = XColor(0xff, 0x88, 0x00);
    self.navigationItem.title = @"me";
    
    // Setting
    UIButton *navItemRightSettingBtn = [[UIButton alloc] init];
    [navItemRightSettingBtn setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [navItemRightSettingBtn setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    [navItemRightSettingBtn sizeToFit];
    [navItemRightSettingBtn addTarget:self action:@selector(navItemRightSettingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // moon
    UIButton *navItemRightMoonBtn = [[UIButton alloc] init];
    [navItemRightMoonBtn setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [navItemRightMoonBtn setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    [navItemRightMoonBtn sizeToFit];
    [navItemRightMoonBtn addTarget:self action:@selector(navItemRightMoonBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:navItemRightSettingBtn], [[UIBarButtonItem alloc] initWithCustomView:navItemRightMoonBtn]];
}

- (void)navItemRightSettingBtnClick:(UIButton *)btn {
    NSLog(@"btn: %@", btn);
    
}

- (void)navItemRightMoonBtnClick:(UIButton *)btn {
    NSLog(@"btn: %@", btn);
    
}

@end


