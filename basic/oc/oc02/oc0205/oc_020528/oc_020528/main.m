//
//  main.m
//  oc_020528
//
//  Created by sq y on 2017/7/13.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, 每一个类的方法列表都存储在类对象中
    02, 每一个方法都有一个与之对应的 SEL 类型的对象
    03, 根据一个 SEL 对象就可以找到方法的地址
    04, _cmd 代表着当前方法
 
    SEL 其实是对方法的一种包装, 将方法包装成一个 SEL 类型的数据, 去找对应的方法地址, 找到方法地址就可以调用方法
    其实消息就是 SEL 
 
 */

#import <Foundation/Foundation.h>

#import "Person.h"

void fun_01() {
    
    // 01, 把 method 包装成 SEL 类型的数据
    // 02, 根据 SEL 数据找到对应的方法地址
    // 03, 根据方法地址调用对应的方法
    
     Person *p = [[Person alloc] init];
    
    //    [p method]; // 直接调用
    SEL sel = @selector(method);
    
    [p performSelector:@selector(method)]; // 间接调用
    [p performSelector:@selector(methodWithArgs:) withObject:(@"this is args")]; // 间接调用带参数方法
}

void fun_02() {
    
    Person *p = [[Person alloc] init];

    NSString *name = @"method";
    SEL s = NSSelectorFromString(name);
    
    [p performSelector:s];
    
}

int sum(int a, int b) {
    return a + b;
}

int main() {
    
    fun_01();
    
    fun_02();
    
    [Person method];
    
    
    int (*pSum)(int, int) = sum;
    NSLog(@"%d\n", pSum(1, 2));
    
    return 0;
}



