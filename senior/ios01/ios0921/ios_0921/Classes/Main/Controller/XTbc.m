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
    XLog
    
    // 移除系统 UITabBar 上自带的按钮
    for(UIView *subview in self.tabBar.subviews) {
        NSLog(@"%@", subview);
        if (![subview isKindOfClass:XTabBar.class]) {
            [subview removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", NSStringFromCGRect(self.tabBar.frame));
    
    [self setUpAllChildVc]; // 添加所有的子控制器
    [self setUpTabBar];
}


#pragma mark - XTabBarDelegate start
- (void)tabBar:(XTabBar *)tabBar didClickBtn:(NSInteger)btnIndex {
    NSLog(@"selectedIndex: %ld", btnIndex);
    self.selectedIndex = btnIndex; // 点击底部的按钮, 切换控制器
}
#pragma mark - XTabBarDelegate end


- (void)setUpTabBar {
    XLog
    
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
- (void)setUpAllChildVc {
    XLog
    
    // 1, LotteryHall ( [ˈlɒtəri] 购彩大厅)
    UIViewController *hall = XLotteryHallVc.alloc.init;
//    hall.view.backgroundColor = UIColor.cyanColor;
    [self setUpChildViewController:hall normalImg:@"TabBar_LotteryHall" selectedImg:@"TabBar_LotteryHall_selected" title:@"LotteyHall"];
    
    
    // 2, MyLottery (我的)
    [self setUpChildViewController:XMyLotteryVc.alloc.init normalImg:@"TabBar_MyLottery" selectedImg:@"TabBar_MyLottery_selected" title:@"MyLottery"];
}

- (void)setUpChildViewController:(UIViewController *)vc normalImg:(NSString *)normalImg selectedImg:(NSString *)selectedImg title:(NSString *)title {
    NSLog(@"title: %@", title);
    
    UINavigationController *navVc = [XNc.alloc initWithRootViewController:vc];
    
//    if ([vc isKindOfClass:XArenaVc.class]) {
//        navVc = [XArenaNc.alloc initWithRootViewController:vc];
//    }
    
    // 图片尺寸是有规格, 不能太大, 如果太大就显示不出来
    navVc.tabBarItem.image = [UIImage imageNamed:normalImg];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImg];
    
    [self.tabBarItemArray addObject:navVc.tabBarItem];
    
    vc.navigationItem.title = title; // 导航条标题
//    nav.tabBarItem.title = title;
    
    [self addChildViewController:navVc];
}

- (NSMutableArray *)tabBarItemArray {
    if (!_tabBarItemArray) {
        _tabBarItemArray = NSMutableArray.array;
    }
    return _tabBarItemArray;
}

@end


