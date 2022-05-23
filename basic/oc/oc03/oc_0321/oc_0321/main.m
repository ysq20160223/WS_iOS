//
//  main.m
//  oc_0321
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*

    01, 封装 类方法 快速返回对象
 
    02, 系统自带的方法里面没有包含 alloc/new/copy , 说明返回的对象都是 autorelease 的
 
    03, 提供类方法, 快速创建一个已经 autorelease 过的对象
        创建对象时一般不用类名, 用 self(子类调用返回子类对象)
 
    04, 对象方法 dealloc 不要直接调用
 
 */

#import <Foundation/Foundation.h>

//#import "../../../../../PrefixHeader.pch"

#import "Person.h"
#import "Student.h"

// 03-21
void fun_01() {
    @autoreleasepool {
        Person *person = [Person person];
        person.age = 1;
        
        NSLog(@"age: %d", person.age);
    }
    
    @autoreleasepool {
        Person *person = [Person personWithAge:21];
        NSLog(@"age: %d", person.age);
    }
}

// 03-22 系统方法
void fun_02() {
    @autoreleasepool {
        NSString *s = @"yy"; // Next Step
        NSLog(@"s: %@; %@", s, [NSString stringWithFormat:@"age: %d", 21]);
    }
}

// 
void fun_03() {
    @autoreleasepool {
//        Student *student = [Student personWithAge:21];
//        student.money = 1;
        
        [Student studentWithAge:21 andMoney:1];
    }
}

int main() {
    fun_01();
    NSLog(@"--------------------------------");
    
    fun_02();
    NSLog(@"--------------------------------");
    
    fun_03();
    NSLog(@"--------------------------------");
    
    return 0;
}


