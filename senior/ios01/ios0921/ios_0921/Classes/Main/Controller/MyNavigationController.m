//
//  MyNavigationController.m
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyNavigationController.h"
#import "UIImage+Image.h"

@interface MyNavigationController () <UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;

@end

@implementation MyNavigationController

+ (void)load {

}

+ (void)setUpNav {
    
    // 获取当前整个应用程序下的所有导航条的外观
    //    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 只影响当前类下的导航条
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // UIBarMetricsCompact : 导航条透明
    // UIBarMetricsDefault : 必须传, 才能设置图片成功, 其他的模式都设置不了
    // 导航控制器的子控制器的 view 高度会减少 64
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条标题颜色
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    
    // 设置导航条标题
    navBar.titleTextAttributes = textAttr;
}

// 第一次使用这个类或者子类的时候调用
// 不一定只调用一次
+ (void)initialize {
    if (self == [MyNavigationController class]) {
        [ self setUpNav];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 清空滑动手势代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.interactivePopGestureRecognizer.delegate = nil;
    
    // 回到导航控制器的根控制器, 恢复滑动手势代理
    // 监听导航控制器回到根控制器
    self.delegate = self;
}

// 导航控制器显示一个控制器完成的时候就会调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    NSLog(@"%@", viewController);
    
    // 是否会到根控制器
    if (viewController == self.childViewControllers[0]) {
//        NSLog(@"%@", viewController);
        
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    } else {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

//
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    // 不是导航控制器的根控制器才需要设置返回按钮
    if (self.childViewControllers.count > 1) {
        // 若覆盖了系统的返回按钮, 滑动返回功能就失效了
        // 恢复滑动返回功能
        
        // 设置左边的按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageNamed:@"NavBack"] style:0 target:self action:@selector(back)];
    }
    
}

// 点击返回按钮返回上一个控制器
- (void)back {
    [self popViewControllerAnimated:YES];
}

@end




