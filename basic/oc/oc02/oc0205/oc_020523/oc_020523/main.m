//
//  main.m
//  oc_020523
//
//  Created by sq y on 2017/7/13.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, 类的本质
    
    02, 类本身也是一个对象, 是一个 Class 对象
 
    03, 当程序启动的时候, 就会加载一次项目中所有的类和分类;
        类加载完毕后就会调用 +load 方法
        当第一次使用这个类的时候, 就会调用一次 +initialize 方法
 
    04, 如有分类, 只会调用分类的 +initialize
 
    05, 类名就代表类对象, 每一个类只有一个类对象
 
    06, %@输出对象时, 默认结果为 : <类名 : 内存地址>
 
    07, NSLog 输出 c 语言字符串的时候不能有中文
 
 */

#import <Foundation/Foundation.h>

#import "../../../../../../PrefixHeader.pch"

#import "Person.h"
#import "Student.h"

void fun_01() {
    // 利用 Class 创建 Person 类对象
    // 利用 Person 类对象 创建 Person 类型的对象
    
    Person *p1 = [[Person alloc] init];
    Person *p2 = [[Person alloc] init];
    
    Class c1 = [p1 class];
    Class c2 = [p2 class];
    Class c3 = [Person class]; // 020524
    
    NSLog(@"c1: %p, c2: %p, c3: %p", c1, c2, c3);
}


// 020524
void fun_02() {
    Person *p = [[Person alloc] init];
    Class c = [p class];
    [c method];
}


//
void fun_03() {
    [[Student alloc] init]; // 会加载分类的 initialize
}


// 020526 description
void fun_04() {
    Person *p = [[Person alloc] init];
    p.age = 21;
    p.name = @"yy";
    NSLog(@"%@", p); // 默认情况下输出对象时, 结果为 <类名: 内存地址>
}


// + description
void fun_05() {
    Class c = [Person class];
    NSLog(@"c = %@", c);
}

void fun_06() {
    NSLog(@"line: %d", __LINE__); // NSLog 输出 C 语言字符串的时候, 不能有中文
    
    printf("file: %s\n", __FILE__);
    
    NSLog(@"__func__: %s", __func__);
    NSLog(@"__FUNCTION__: %s", __FUNCTION__);
    
    NSLog(@"__PRETTY_FUNCTION__: %s", __PRETTY_FUNCTION__);
}

int main() {
    
    fun_01();
    
//    fun_02();
    
//    fun_03();
    
//    fun_04();
    
//    fun_05();
    
//    fun_06();
    
    return 0;
}




