//
//  MyTabBarController.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XTabBarController.h"


#import "XLotteryHallViewController.h"
#import "MyArenaViewController.h"
#import "MyDiscoverViewController.h"

#import "MyHistoryViewController.h"
#import "MyMyLotteryViewController.h"

//
#import "XTabBar.h"

#import "XNavigationController.h"
#import "MyArenaNavController.h"

@interface XTabBarController () <XTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *tabBarItemArray; // 模型

@end



@implementation XTabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"");
    // 移除系统 UITabBar 上自带的按钮
    for(UIView *subview in self.tabBar.subviews) {
//        NSLog(@"%@", subview);
        if ([subview isKindOfClass:[XTabBar class]] == NO) {
            [subview removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"");
    [self setUpAllChildViewController]; // 添加所有的子控制器
    
    [self setUpTabBar];
}


#pragma mark - MyTabBarDelegate start
- (void)tabBar:(XTabBar *)tabBar didClickBtn:(NSInteger)btnIndex {
//    NSLog(@"index: %ld", btnIndex);
    self.selectedIndex = btnIndex; // 点击底部的按钮, 切换控制器
}
#pragma mark - MyTabBarDelegate end


- (void)setUpTabBar {
    // 1, 移除系统的 TabBar
//    [self.tabBar removeFromSuperview];
    
    // 2, 添加自定义 TabBar
    XTabBar *xTabBar = [[XTabBar alloc] initWithFrame:self.tabBar.bounds];
    xTabBar.backgroundColor = [UIColor cyanColor];
    
    xTabBar.tabBarItems = self.tabBarItemArray;
//    NSLog(@"count : %ld", self.items.count);
    
    xTabBar.delegate = self; // 设置代理 (点击TabBarItem切换控制器)
    
    [self.tabBar addSubview:xTabBar];
}

// 添加所有的子控制器
- (void)setUpAllChildViewController {
    // 1, LotteryHall ( [ˈlɒtəri] 购彩大厅)
    UIViewController *hall = [[XLotteryHallViewController alloc] init];
//    hall.view.backgroundColor = [UIColor cyanColor];
    [self setUpChildViewController:hall normalImg:@"TabBar_LotteryHall_new" selectedImg:@"TabBar_LotteryHall_selected_new" title:@"LotteyHall"];
    
    
    // 2, Arena ( [əˈri:nə] 竞技场)
    [self setUpChildViewController:[[MyArenaViewController alloc] init] normalImg:@"TabBar_Arena_new" selectedImg:@"TabBar_Arena_selected_new" title:@"Arena"];

    
    // 3, Discover (发现)
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MyDiscoverViewController" bundle:nil];
    UIViewController *discover = [storyboard instantiateInitialViewController];
    [self setUpChildViewController:discover normalImg:@"TabBar_Discovery_new" selectedImg:@"TabBar_Discovery_selected_new" title:@"Discover"];
    
    
    // 4, History (开奖信息)
    [self setUpChildViewController:[[MyHistoryViewController alloc] init] normalImg:@"TabBar_History_new" selectedImg:@"TabBar_History_selected_new" title:@"History"];
    
    
    // 5, MyLottery (我的)
    [self setUpChildViewController:[[MyMyLotteryViewController alloc] init] normalImg:@"TabBar_MyLottery_new" selectedImg:@"TabBar_MyLottery_selected_new" title:@"MyLottery"];
}

- (void)setUpChildViewController:(UIViewController *)vc normalImg:(NSString *)normalImg selectedImg:(NSString *)selectedImg title:(NSString *)title {
    UINavigationController *navVc = [[XNavigationController alloc] initWithRootViewController:vc];
    
    if ([vc isKindOfClass:[MyArenaViewController class]]) {
        navVc = [[MyArenaNavController alloc] initWithRootViewController:vc];
    }
    
    // 图片尺寸是有规格, 不能太大, 如果太大就显示不出来
    navVc.tabBarItem.image = [UIImage imageNamed:normalImg];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImg];
    
    [self.tabBarItemArray addObject:navVc.tabBarItem];
    
    vc.navigationItem.title = title; // 导航条标题
//    nav.tabBarItem.title = title;
    
    [self addChildViewController:navVc];
}

- (NSMutableArray *)tabBarItemArray {
    if (_tabBarItemArray == nil) {
        _tabBarItemArray = [NSMutableArray array];
    }
    return _tabBarItemArray;
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


