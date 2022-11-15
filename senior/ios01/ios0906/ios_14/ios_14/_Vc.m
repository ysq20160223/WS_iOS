//
//  ViewController.m
//  ios_14
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "_Vc.h"
#import "SecondVc.h"

@interface _Vc ()

@end



@implementation _Vc

- (void)viewWillAppear:(BOOL)animated {
    NSMutableDictionary<NSAttributedStringKey, id> *dict = [NSMutableDictionary dictionary];
    [dict setObject:XColor(0xee, 0xee, 0xee) forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = UINavigationBarAppearance.alloc.init;
        appearance.backgroundColor = XColorAlpha(0x7f, 0x7f, 0x7f, 1);
        appearance.titleTextAttributes = dict;
        self.navigationController.navigationBar.standardAppearance = appearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    }
    
}

- (void)viewDidLoad {
    self.navigationItem.title = @"_Vc";
}

- (IBAction)jump2Two:(id)sender {
    // 只有导航控制器才有跳转功能
    // 只要是导航控制器的子控制器就能拿到导航控制器
    NSLog(@"%@", self.navigationController);
    
    SecondVc *twoViewController = SecondVc.alloc.init;
    [self.navigationController pushViewController:twoViewController animated:YES];
    
    // 会把 push 的控制器添加为导航控制器的子控制器, 而且会把新 push 的控制器的 view 添加到导航控制的view上
    
    NSLog(@"%@", self.navigationController.childViewControllers);
}

@end


