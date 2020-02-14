//
//  MyTabBarController.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyTabBarController.h"


#import "MyLotteryHallViewController.h"
#import "MyArenaViewController.h"
#import "MyDiscoverViewController.h"

#import "MyHistoryViewController.h"
#import "MyMyLotteryViewController.h"

//
#import "MyTabBar.h"

#import "MyNavigationController.h"
#import "MyArenaNavController.h"

@interface MyTabBarController () <MyTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items; // 记录每个字控制对应的按钮的模型

@end



@implementation MyTabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 移除系统 UITabBar 上自带的按钮
    for(UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[MyTabBar class]] == NO) {
            [childView removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpAllChildViewController]; // 添加所有的子控制器
    
    [self setUpTabBar]; //
    
}

// 点击底部的按钮, 切换控制器
- (void)tabBar:(MyTabBar *)tabBar didClickBtn:(NSInteger)btnIndex {
    self.selectedIndex = btnIndex;
}

- (void)setUpTabBar {
    // 1, 移除系统的 TabBar
//    [self.tabBar removeFromSuperview];
    
    // 2, 添加自定义 TabBar
    MyTabBar *tabBar = [[MyTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.backgroundColor = [UIColor cyanColor];
    
    tabBar.items = self.items;
//    NSLog(@"count : %ld", self.items.count);
    
    tabBar.delegate = self; // 设置代理
    
    [self.tabBar addSubview:tabBar];
    
}

// 添加所有的子控制器
- (void)setUpAllChildViewController {
    
    // 1, LotteryHall
    UIViewController *hall = [[MyLotteryHallViewController alloc] init];
    [self setUpChildViewController:hall normalImg:@"TabBar_LotteryHall_new" selectedImg:@"TabBar_LotteryHall_selected_new" title:@"LotteyHall"];
    
    // 2, Arena
    UIViewController *arena = [[MyArenaViewController alloc] init];
    arena.view.backgroundColor = [UIColor cyanColor];
    [self setUpChildViewController:arena normalImg:@"TabBar_Arena_new" selectedImg:@"TabBar_Arena_selected_new" title:@"Arena"];

    // 3, Discover
    // 加载 storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MyDiscoverViewController" bundle:nil];
//    UIViewController *discover = [[MyDiscoverViewController alloc] init];
    UIViewController *discover = [storyboard instantiateInitialViewController];
    
    [self setUpChildViewController:discover normalImg:@"TabBar_Discovery_new" selectedImg:@"TabBar_Discovery_selected_new" title:@"Discover"];
    
    // 4, History
    UIViewController *history = [[MyHistoryViewController alloc] init];

    [self setUpChildViewController:history normalImg:@"TabBar_History_new" selectedImg:@"TabBar_History_selected_new" title:@"History"];
    
    // 5, MyLottery
    UIViewController *myLottery = [[MyMyLotteryViewController alloc] init];
    [self setUpChildViewController:myLottery normalImg:@"TabBar_MyLottery_new" selectedImg:@"TabBar_MyLottery_selected_new" title:@"MyLottery"];
}

- (void)setUpChildViewController:(UIViewController *) vc normalImg:(NSString *)normalImg selectedImg:(NSString *)selectedImg title:(NSString *)title {
    
    UINavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:vc];
    
    //
    if ([vc isKindOfClass:[MyArenaViewController class]]) {
        nav = [[MyArenaNavController alloc] initWithRootViewController:vc];
    }
    
    [self.items addObject:nav.tabBarItem]; //
    
    nav.tabBarItem.image = [UIImage imageNamed:normalImg]; // 图片尺寸是有规格, 不能太大, 如果太大就显示不出来
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImg];
    
    vc.navigationItem.title = title; // 导航条标题
    
//    nav.tabBarItem.title = title;
    
    [self addChildViewController:nav];
}

- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
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


