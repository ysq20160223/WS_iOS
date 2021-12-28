//
//  main.m
//  oc_020501
//
//  Created by Apple on 2017/7/10.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, 点语法 : 本质还是方法调用
 
 */

#import <Foundation/Foundation.h>

#import "../../../../../../PrefixHeader.pch"
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *person = [Person new];
    
//    [person setAge:21];
//    NSLog(@"age = %d", [person age]);
    
    person.age = 17;
    [person setAge:21];
    
    NSLog(@"person.age: %d; [person age]: %d", person.age, [person age]);
    
    return 0;
}


