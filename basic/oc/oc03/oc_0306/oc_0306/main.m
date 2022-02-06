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

#import "../../../../../PrefixHeader.pch"

#import "Person.h"
#import "Book.h"

int main() {
    
    Book *book = [Book.alloc init];
    
    Person *p1 = [Person.alloc init];
    [p1 setBook:book];
    
    [p1 release];
    p1 = nil;
    
    [book release];
    book = nil;
    
    return 0;
}


