//
//  Person.m
//  oc_020510
//
//  Created by sq y on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

// 重写 -init
- (id)init {
    /*
    // 01, 一定要调用 super 的 init 方法 : 初始化父类中的一些成员变量和属性
    self = [super init]; // 当前对象 self
    
    if(self) {
        // 初始化成功
        _age = 1;
    }
    */
    
    NSLog(@"");
    if(self = [super init]) {
        _age = 3;
    }
    return self;
}

@end
