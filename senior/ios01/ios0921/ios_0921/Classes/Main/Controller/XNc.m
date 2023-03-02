//
//  XNc.m
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XNc.h"
#import "UIImage+X.h"

#define commonBgColor XColorAlpha(0x35, 0x36, 0x37, 0.99)

@interface XNc () <UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;

@end



@implementation XNc

+ (void)setUpNav {
    // 获取当前整个应用程序下的所有导航条的外观
//        UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 只影响当前类下的导航条
//    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];

    // UIBarMetricsCompact : 导航条透明
    // UIBarMetricsDefault : 必须传, 才能设置图片成功, 其他的模式都设置不了
    // 导航控制器的子控制器的 view 高度会减少 64
//    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//    navBar.shadowImage = UIImage.alloc.init; // 清空导航条的阴影的线

    // 设置导航条标题颜色
    NSMutableDictionary *textAttrDict = NSMutableDictionary.dictionary;
    textAttrDict[NSForegroundColorAttributeName] = UIColor.whiteColor;
    textAttrDict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];

    // 设置导航条标题
    navBar.titleTextAttributes = textAttrDict;
    
    
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = UINavigationBarAppearance.alloc.init;
//        appearance.backgroundColor = commonBgColor;
        appearance.backgroundImage = [UIImage imageNamed:@"NavBar64"];
        appearance.titleTextAttributes = textAttrDict;
        navBar.standardAppearance = appearance;
        navBar.scrollEdgeAppearance = appearance;
    }
}


// 第一次使用这个类或者子类的时候调用 (不一定只调用一次)
+ (void)initialize {
    NSLog(@"%@", self);
    if (self == XNc.class) {
        [self setUpNav];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    
//    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    // 清空滑动手势代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
//    self.interactivePopGestureRecognizer.delegate = nil;
    
    // 回到导航控制器的根控制器, 恢复滑动手势代理
    self.delegate = self; // 监听导航控制器回到根控制器
}


#pragma mark - UINavigationControllerDelegate start
// 导航控制器显示一个控制器完成的时候就会调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"%@; %@", viewController, self.childViewControllers[0]);
    
    // 是否回到根控制器
    if (viewController == self.childViewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = _popDelegate; //
    } else {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
#pragma mark - UINavigationControllerDelegate end


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    XLog
    
    // 不是导航控制器的根控制器才需要设置返回按钮
    if (self.childViewControllers.count > 1) {
        // 设置左边的按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithImage:[UIImage xImageWithOriginalImageNamed:@"NavBack"] style:0 target:self action:@selector(didClickBack:)];
    }
}

// 若覆盖了系统的返回按钮, 滑动返回功能就失效了
// 点击返回按钮返回上一个控制器
- (void)didClickBack:(id)_id {
    NSLog(@"%@", _id);
    [self popViewControllerAnimated:YES];
}

@end


