//
//  main.m
//  oc_0317
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, autorelease 方法会返回对象本身
        autorelease 会将对象放到一个自动释放池中, 当自动释放池被销毁时, 
        会对池子里面的所有对象做一次 release 操作
        对象计数器不变
 
    02, 好处
        不用关心对象释放的时间
        不用关心什么时候掉用 release
 
    03, 使用注意
        占用内存较大的对象不要随便使用 autorelease
    
    04, 自动释放池
        在iOS程序运行过程中会创建无数个池子, 这些池子都是以栈结构存在 (先进后出)
        当一个对象调用 autorelease 方法时, 会将对象放到栈顶的释放池
 
 */

#import <Foundation/Foundation.h>

//#import "../../../../../PrefixHeader.pch"

#import "Person.h"

int main() {
    @autoreleasepool {
        Person *p = [Person.alloc initWithAge:21].autorelease;
        NSLog(@"age: %d", p.age);
    }
    
    NSLog(@"main end");
    return 0;
}


