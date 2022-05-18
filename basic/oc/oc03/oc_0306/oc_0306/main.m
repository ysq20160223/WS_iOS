//
//  main.m
//  oc_0306
//
//  Created by Apple on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, 通过 alloc/new/copy 创建一个对象, 必须调用 release/autorelease
    02, 谁 retain 谁 release
 */

#import <Foundation/Foundation.h>

//#import "../../../../../PrefixHeader.pch"

#import "Person.h"
#import "Book.h"

int main() {
    
    Book *b1 = Book.alloc.init;
    b1.price = 1;
    
    Book *b2 = Book.alloc.init;
    b2.price = 21;
    
    Person *p = Person.alloc.init;
    [p setBook:b1];
    [p setBook:b2];
    
    [p release];
    p = nil;
    
    [b1 release];
    b1 = nil;
    
    [b2 release];
    b2 = nil;
    
    return 0;
}


