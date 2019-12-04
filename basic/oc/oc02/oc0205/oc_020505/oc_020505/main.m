//
//  main.m
//  oc_020505
//
//  Created by sq y on 2017/7/11.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, @property: 自动生成 set/get 的声明
    02, @synthesize: 自动生成 set/set 的实现
 
    03, @property 新特性可以生成 声明和实现
    
    04, 万能指针 id 相当于 NSObject *
 
 
 */

#import <Foundation/Foundation.h>

#import "Person.h"

#import "../../../../../../PrefixHeader.pch"

int main(int argc, const char * argv[]) {
    
    Person *person = [Person new];
    person.age = 21; // 为不带下划线的 age 赋值
    [person setHeight:170];
    
    NSLog(@"age: %d, height: %d", person.age, [person height]);
    
    
    //
    id _id = [Person new];
    [_id setHeight:55];
    NSLog(@"height: %d", [_id height]);
    
    
    return 0;
}




