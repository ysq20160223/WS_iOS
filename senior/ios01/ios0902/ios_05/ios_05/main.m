//
//  main.m
//  ios_05
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 第三个参数 : UIApplication 类名或者子类的名称 : nil == @"UIApplication"
        // 第四个参数 : UIApplication 的代理的类型名称
        
        // NSStringFromClass : 把类名转化为字符串
        
        // UIApplicationMain 底层实现
        // 01, 根据 principalClassName 传递的类名创建 UIApplication 对象
        // 02, 创建 UIApplication 代理对象, 给 UIApplication 对象设置代理
        // 03, 开启主运行事件循环, 处理事件, 保持程序一直运行
        // 04, 加载 Info.plist, 判断下是否指定 main ,如果指定了就会去加载
        
        NSLog(@"");
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
