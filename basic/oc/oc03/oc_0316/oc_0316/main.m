//
//  main.m
//  oc_0316
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, @class : 仅仅说明是一个类
 
    02, 在 .h 文件中用 @class 来声明类
        在 .m 文件中用 #import 来包含所有类的所有内容
 
    03, 两端循环引用的情况
        一端用 retain , 一端用 assign
 
 */

#import <Foundation/Foundation.h>

//#import "../../../../../PrefixHeader.pch"

#import "Person.h"
#import "IDCard.h"

int main() {
    Person *person = [Person.alloc init];
    IDCard *card = [IDCard.alloc init];
    
    person.card = card;
    card.person = person;
    
    [card release];
    [person release];
    
    return 0;
}


