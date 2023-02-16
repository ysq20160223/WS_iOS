//
//  XMyLotteryVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XMyLotteryVc.h"

#import "UIImage+X.h"

#import "XSettingVc.h"

@interface XMyLotteryVc ()

@end



@implementation XMyLotteryVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLoginBtnBackgroundImage];
    
    [self setUpNavBar];
}

// 设置导航条的内容
- (void)setUpNavBar {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"MM" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageWithOriginalImageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithImage:[UIImage imageWithOriginalImageNamed:@"Mylottery_config"] style:0 target:self action:@selector(setting)];
}


- (void)leftClick:(UIButton *)btn {
//    NSLog(@"");
    
}

// 点击设置按钮
- (void)setting {
    XSettingVc *settingVc = XSettingVc.alloc.init;
    settingVc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:settingVc animated:YES];
}

- (void)setLoginBtnBackgroundImage {
    // 在 xib 或者 stroyboard 中, 不能直接拉伸按钮的图片
    // 按钮的背景图片只能通过代码去拉伸
    UIImage *image = _loginBtn.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * .5 topCapHeight:image.size.height * .5];
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
}

@end


