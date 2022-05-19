//
//  main.m
//  oc_0310
//
//  Created by Apple on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "../../../../../PrefixHeader.pch"

#import "Person.h"
#import "Car.h"

#import "Dog.h"
#import "Student.h"


/*
    内存管理代码规范
        只要调用了 alloc, 必须 release/autorelease
 */

void fun_01() {
    Person *p = [Person.alloc initWithAge:21];
    
    //
    Car *c1 = [Car.alloc initWithSpeed:170];
    p.car = c1;
    
    //
    Car *c2 = [Car.alloc initWithSpeed:210];
    p.car = c2;
    
    //
    [c2 release];
    [c1 release];
    [p release];
}


void fun_02() {
    //
//    Student *student = [Student.alloc initWithNo:21];
//    [student setName:@"yy"]; // @"" 不是通过 alloc 产生, 不用 release
    
    Student *student = [Student.alloc initWithNo:21 andName:@"jj"];
    
    //
    Car *car = [Car.alloc initWithSpeed:210];
    Dog *dog = [Dog.alloc init];

    student.car = car;
    student.dog = dog;
    
    [dog release];
    [car release];
    [student release];
}

int main() {
    
    fun_01();
    NSLog(@"-----------------------");
    
    fun_02();
    
    return 0;
}


