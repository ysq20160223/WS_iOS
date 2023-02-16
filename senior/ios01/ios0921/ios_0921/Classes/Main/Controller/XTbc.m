//
//  XTbc.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//


#import "XTbc.h"
#import "XTabBar.h"
#import "XNc.h"

#import "XLotteryHallVc.h" //
#import "XArenaNc.h"
#import "XArenaVc.h"
#import "XDiscoverVc.h"
#import "XHistoryVc.h"
#import "XMyLotteryVc.h"



@interface XTbc () <XTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *tabBarItemArray; // 模型

@end



@implementation XTbc

- (instancetype)init {
    if (self == [super init]) {
        if (@available(iOS 11.0, *)) {
//            self.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, -34, 0);
        } else {
            // Fallback on earlier versions
        }
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 移除系统 UITabBar 上自带的按钮
    for(UIView *subview in self.tabBar.subviews) {
        if ([subview isKindOfClass:XTabBar.class] == NO) {
            [subview removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", NSStringFromCGRect(self.tabBar.frame));
    
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
    XTabBar *xTabBar = [XTabBar.alloc initWithFrame:self.tabBar.bounds];
    xTabBar.tabBarItems = self.tabBarItemArray;
//    NSLog(@"count : %ld", self.items.count);
    
    xTabBar.xTabBarDelegate = self; // 设置代理 (点击TabBarItem切换控制器)
    
    self.tabBar.barTintColor = UIColor.blackColor;
    self.tabBar.translucent = NO;
    [self.tabBar addSubview:xTabBar];
}

// 添加所有的子控制器
- (void)setUpAllChildViewController {
    // 1, LotteryHall ( [ˈlɒtəri] 购彩大厅)
    UIViewController *hall = XLotteryHallVc.alloc.init;
//    hall.view.backgroundColor = UIColor.cyanColor;
    [self setUpChildViewController:hall normalImg:@"TabBar_LotteryHall_new" selectedImg:@"TabBar_LotteryHall_selected_new" title:@"LotteyHall"];
    
    
    // 2, Arena ( [əˈri:nə] 竞技场)
    [self setUpChildViewController:XArenaVc.alloc.init normalImg:@"TabBar_Arena_new" selectedImg:@"TabBar_Arena_selected_new" title:@"Arena"];

    
    // 3, Discover (发现)
    [self setUpChildViewController:XDiscoverVc.instance normalImg:@"TabBar_Discovery_new" selectedImg:@"TabBar_Discovery_selected_new" title:@"Discover"];
    
    
    // 4, History (开奖信息)
    [self setUpChildViewController:XHistoryVc.alloc.init normalImg:@"TabBar_History_new" selectedImg:@"TabBar_History_selected_new" title:@"History"];
    
    
    // 5, MyLottery (我的)
    [self setUpChildViewController:XMyLotteryVc.alloc.init normalImg:@"TabBar_MyLottery_new" selectedImg:@"TabBar_MyLottery_selected_new" title:@"MyLottery"];
}

- (void)setUpChildViewController:(UIViewController *)vc normalImg:(NSString *)normalImg selectedImg:(NSString *)selectedImg title:(NSString *)title {
    UINavigationController *navVc = [XNc.alloc initWithRootViewController:vc];
    
    if ([vc isKindOfClass:XArenaVc.class]) {
        navVc = [XArenaNc.alloc initWithRootViewController:vc];
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

@end


