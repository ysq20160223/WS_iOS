//
//  MyArenaViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyArenaViewController.h"

@interface MyArenaViewController ()

@end

@implementation MyArenaViewController

- (void)loadView {
    // 自己创建控制器的 view
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    imageView.userInteractionEnabled = YES;
    
    self.view = imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavBar];
    
}

- (void)setNavBar {
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"FootBall", @"BasketBall"]];
    segment.selectedSegmentIndex = 0;
    
    UIColor *tintColor = [UIColor colorWithDisplayP3Red:(65 / 255.0) green:(165 / 255.0) blue:(169 / 255.0) alpha:1];
    segment.tintColor = tintColor;
    
    // 设置选中的背景图片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 设置文字
    NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSForegroundColorAttributeName] = tintColor;
    [segment setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segment setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    self.navigationItem.titleView = segment; // 设置导航条的内容
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end





