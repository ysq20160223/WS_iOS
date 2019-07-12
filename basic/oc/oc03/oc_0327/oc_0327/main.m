//
//  main.m
//  oc_0327
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, 工程名 -> Build Phases -> Compile Sources -> 双击某个文件
        添加 arc : -f-objc-arc
        取消 arc : -fno-objc-arc
 */

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "User.h"
#import "Status.h"

#import "NoObjcARC.h"

int main() {
    
    // --
    User *u1 = [[User alloc] init];
    u1.name = @"原创作者";
    
    //
    User *u2 = [[User alloc] init];
    u2.name = @"非原创作者";
    
    //
    Status *s1 = [[Status alloc] init];
    s1.text = @"原创数据";
    s1.user = u1;
    
    //
    Status *s2 = [[Status alloc] init];
    s2.retweenStatus = s1;
    s2.text = @"非原创数据";
    s2.user = u2;
    
    
    return 0;
}



