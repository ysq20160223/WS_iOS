//
//  MeNavController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeViewController.h"
#import "UIBarButtonItem+X.h"

@interface MeViewController ()

@end



@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XLog
    self.view.backgroundColor = XColor(0xff, 0x88, 0x00);
    self.navigationItem.title = @"me";
    
    self.navigationItem.rightBarButtonItems = @[
        [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click" tartget:self action:@selector(navItemRightSettingBtnClick:)],
        [UIBarButtonItem itemWithImage:@"mine-moon-icon" highlightImage:@"mine-moon-icon-click" tartget:self action:@selector(navItemRightMoonBtnClick:)]
    ];
}

- (void)navItemRightSettingBtnClick:(UIButton *)btn {
    NSLog(@"btn: %@", btn);
    
}

- (void)navItemRightMoonBtnClick:(UIButton *)btn {
    NSLog(@"btn: %@", btn);
    
}

@end


