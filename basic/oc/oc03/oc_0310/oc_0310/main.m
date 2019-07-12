//
//  main.m
//  oc_0310
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Person.h"
#import "Car.h"

#import "Dog.h"
#import "Student.h"

/*
    内存管理代码规范
        只要调用了 alloc, 必须 release/autorelease
 
 */

void fun_01() {
    Person *p = [[Person alloc] init];
    p.age = 21;
    
    //
    Car *c1 = [[Car alloc] init];
    c1.speed = 170;
    
    p.car = c1;
    
    //
    Car *c2 = [[Car alloc] init];
    c2.speed = 210;
    
    p.car = c2;
    
    //
    [c2 release];
    [c1 release];
    [p release];
}

void fun_02() {
    Student *student = [[Student alloc] init];
    
    [student setNo:21];
    
    //
    [student setName:@"yy"]; // @"" 不是通过 alloc 产生, 不用 release
    
    //
    Car *car = [[Car alloc] init];
    [car setSpeed:300];
    [student setCar:car];
    
    //
    Dog *dog = [[Dog alloc] init];
    [student setDog:dog];
    
    [dog release];
    [car release];
    [student release];
}

int main() {
    
//    fun_01();
    
    fun_02();
    
    return 0;
}



