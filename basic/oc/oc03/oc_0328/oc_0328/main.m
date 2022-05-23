//
//  main.m
//  oc_0328
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    项目采用 arc
        Person, main 采用非 arc
        Dog 采用 arc
 
    01, 循环引用 - 解决办法
        ARC : 一端用 strong, 一端用 weak
        非 ARC : 一端用 retain, 一端用 assign
    
 */

#import <Foundation/Foundation.h>

//#import "../../../../../PrefixHeader.pch"

#import "Dog.h"
#import "Person.h"

int main() {
    @autoreleasepool {
        Person *person = Person.alloc.init;
        
        Dog *dog = Dog.alloc.init;
        dog.person = person;
        
        person.dog = dog;
        
        [dog release];
        [person release];
    }
    return 0;
}


