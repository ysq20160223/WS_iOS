//
//  main.m
//  oc_020510
//
//  Created by Apple on 2017/7/11.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
 01, 构造方法
 
 02, 完成地创建一个可用的对象
 分配存储空间 +alloc
 初始化 -init
 
 03, 重写 init
 先调用父类构造方法
 再进行子类内部成员变量的初始化
 
 04, 自定义构造方法
 一定是对象方法
 返回值一般是 id 类型
 方法名以 init 开头
 
 
 */

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Student.h"
#import "Work.h"
#import "Employee.h"

#import "../../../../../../PrefixHeader.pch"


// 复写 init 方法, 进行初始化
void fun_01() {
    //    [Person new]; // 相当于 [[Person alloc] init]
    Person *person = [Person.alloc init];
    //    person.age = 21;
    
    NSLog(@"Person age: %d", person.age);
}


// 先初始化父类的 init 方法
void fun_02() {
    Student *student = [Student new];
    NSLog(@"Student no: %d", student.no);
}


// 自定义构造方法
void fun_03() {
    Work *work = [Work.alloc initWithName:@"root"];
    NSLog(@"name: %@", work.name);
}


// 自定义构造方法
void fun_04() {
    Employee *employee = [Employee.alloc initWithNo:21 andName:@"root"];
    NSLog(@"No: %d; name: %@", employee.no, employee.name);
}


int main() {
    
    fun_01();
    NSLog(@"---------------");
    
    fun_02();
    NSLog(@"===============");
    
    fun_03();
    NSLog(@"***************");
    
    fun_04();
    
    return 0;
}


