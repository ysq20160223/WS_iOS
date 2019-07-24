//
//  main.m
//  oc_0301
//
//  Created by sq y on 2017/7/13.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
 01, 引用计算器 : 占用四个字节
 
 02, 当使用 alloc／new/copy 创建一个对象时, 引用计数器默认就是1
 给对象发送一条 retain 消息, 引用计数器 +1
 给对象发送一条 release 消息, 引用计数器 -1
 retainCount : 消息当前的引用计数器值
 
 03, 对象销毁
 当一个对象的引用计数器值为 0 时, 对象将被销毁, 其占用的内存被系统回收
 当一个对象被销毁时, 系统会自动向对象发送一条 dealloc 消息
 一般会重写 dealloc 方法, 必须调用 [super dealloc], 并且放在后面调用
 不要直接调用 dealloc 方法
 
 04, retain : 计数器+1, 方法返回的是对象本身
 release : 计数器-1, 没有返回值
 retaincount : 获取当前的计数器值
 dealloc : 当对象被回收就会调用; 一定要调用
 
 05, 僵尸对象 : 所占用的内存已经被回收的对象, 僵尸对象不能再使用
 野指针 : 指向僵尸对象的指针, 给野指针发送消息会报错 (EXC_BAD_ACCESS)
 空指针 : 没有指向任何东西的指针(存储的东西为 nil/NULL/0), oc 不存在空指针错误, 给空指针发送消息, 不报错
 
 
 */

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Person.h"


int main() {
    
    Person *p = [[Person alloc] init];
    
    NSLog(@"c = %ld", [p retainCount]);
    
    [p release];
    
//    p.age = 10; // 给被销毁的对象发送对象, error: message sent to deallocated instance 0x100202cd0
//    [p release]; // 给被销毁的对象发送对象, error: message sent to deallocated instance 0x100202cd0
    
    
    p = nil; // 指针 p 变成空指针
//    [p release]; // 调用了 p = nil; 之后, 不会报错
    p.age = 10;
    
    return 0;
}




