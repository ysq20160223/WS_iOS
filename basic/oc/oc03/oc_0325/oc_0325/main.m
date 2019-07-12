//
//  main.m
//  oc_0325
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, ARC 原理 : automatic reference counting
        只要没有强指针指向对象, 就会释放对象
 
    02, 强指针 : 默认情况下, 所有的指针都是强指针
        弱指针 :
 
    03, @property 的参数
        strong : 成员变量是强指针 (适合 oc 对象)
        weak : 成员变量是弱指针 (适合 oc 对象)
        assign : 适合于非 oc 对象类型
 
 */

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Person.h"
#import "Dog.h"


void fun_01() {
    Person *p = [[Person alloc] init];
    p.age = 21;
    
    NSLog(@"age: %d", p.age);
    
    
    __weak Person *p1 = p;
//    p = nil; // 指针 p 所指对象被销毁
    
    NSLog(@"p1: %p", p1); //
    
    // 弱指针 : 没有意义
    __weak Person *p2 = [[Person alloc] init];
    NSLog(@"p2: %p", p2); //
    
}

//
void fun_02() {
    
    Person *p = [[Person alloc] init];
    
    Dog *d = [[Dog alloc] initWithAge:1];
    p.dog = d;
    
    d = [[Dog alloc] initWithAge:9];
}

int main(int argc, const char * argv[]) {
   
//    fun_01();
    
    fun_02();
    
    return 0;
}



