//
//  RecommendViewController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()

@end



@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    XLog
    self.view.backgroundColor = XColor(0xff, 0x00, 0xff);
    self.navigationItem.title = @"Recommend";
    
    //
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:XColor(237, 77, 61) forState:UIControlStateHighlighted];
    [backBtn sizeToFit];
    
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end


