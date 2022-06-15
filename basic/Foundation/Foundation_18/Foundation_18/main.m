//
//  main.m
//  Foundation_18
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, NSDate
 */

#import <Foundation/Foundation.h>

void fun_01() {
    NSDate *date = NSDate.date; // 格林时间
    NSLog(@"date: %@", date);
    
    //
    date = [NSDate dateWithTimeInterval:8 sinceDate:date];
    NSLog(@"date: %@", date);
}

// 将 时间对象 转化 为字符串
void fun_02() {
    NSDateFormatter *formate = NSDateFormatter.alloc.init;
    formate.dateFormat = @"yyyy-MM-dd HH:mm:ss_SSS";
    
    NSLog(@"date: %@", [formate stringFromDate:NSDate.date]);
}

// 将 时间字符串 转化为 对象
void fun_03() {
    NSDateFormatter *formatter = NSDateFormatter.alloc.init;
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss_SSS";
    
    NSLog(@"date: %@", [formatter dateFromString:@"2017/7/16 22:36:17_111"]);
}

//
int main() {
    @autoreleasepool {
        fun_01();
        NSLog(@"---------");
        
        fun_02();
        NSLog(@"=========");
        
        fun_03();
    }
    return 0;
}


