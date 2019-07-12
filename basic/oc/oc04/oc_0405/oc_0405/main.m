//
//  main.m
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Person.h"

#import "MyProtocol.h"
#import "MyProtocol_01.h"
#import "MyProtocol_02.h"

#import "Dog.h"
#import "BlockDog.h"

int main() {
    @autoreleasepool {
        
        // ---
        NSObject *obj1 = [[NSObject alloc] init];
        obj1 = nil;
        
        // --- 限制对象类型
        NSObject<MyProtocol_02> *obj2 = [[Person alloc] init];
        [obj2 requiredMethod];
        [obj2 requiredMethod_01];
        [obj2 requiredMethod_02];
        
        // --- id = NSObject *
        id<MyProtocol> obj3 = [[Person alloc] init];
        obj3 = nil;
        
        // 0408 保存的对象遵守 MyProtocol, 并且继承 Person
        Person<MyProtocol> *obj4 = [[Person alloc] init];
        obj4 = nil;
        
        // ---
        Person *p = [[Person alloc] init];
        Dog *d = [[Dog alloc] init];
        p.obj = d;
        
        //
        BlockDog *bd = [[BlockDog alloc] init];
        p.obj = bd; // Dog 已实现协议
    }
    return 0;
}




