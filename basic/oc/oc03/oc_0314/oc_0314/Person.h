//
//  Person.h
//  oc_0314
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, set 方法的内存管理相关的参数
        retain : release旧值, 适合 oc 对象
        assign : 直接赋值, 默认, 非 oc 对象
        copy : releaase旧值, copy新值
 
    02, 是否要生成 set 方法
        readwrite : 可读可写, 默认
        readonly : 只读
 
    03, 多线程管理
        nonatomic : 性能高
        atomic : 性能低(默认)
 
    04, set 和 get 的名称
        getter = xxx
        setter = setXxx:
 */

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign) int age;

@property (nonatomic, getter = isRich, assign) BOOL rich;

@end


