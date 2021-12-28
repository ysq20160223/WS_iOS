//
//  Person.h
//  oc_020505
//
//  Created by Apple on 2017/7/11.
//  Copyright © 2017年 mac. All rights reserved.
//



#import <Foundation/Foundation.h>

// @property(性质, 性能) : 自动生成 set/get 的声明, 生成带下划线的成员变量; 新特性可以生成 声明和实现

@interface Person : NSObject
{
    int _age;
    int age; 
//    int _height;

}

@property int age; // 这里创建的成员变量是 private, 子类不能直接访问

@property int height;

//@property int age, height;

@end


