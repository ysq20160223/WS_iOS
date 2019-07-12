//
//  main.m
//  Foundation_05
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, NSString : 不可变字符串
        NSMutableString : 可变字符串
 
    02, NSArray
        NSMutableArray
 
    03, NSSet
        NSMutableSet
 
    04, NSDictionary
        NSMutableDictionary
 
    05, NSDate
    
    06, NSObjcet
 
 */

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"



void fun_01() {
    
    // 1
//    NSLog(@"%@", @"This is sting");
    
    // 2
//    NSLog(@"%@", [[NSString alloc] initWithString:@"s2"]); // 不建议使用
    
    // 3
//    NSLog(@"%@", [[NSString alloc] initWithFormat:@"This is %@", @"s3"]);
//    NSLog(@"%@", [NSString stringWithFormat:@"This is %@", @"s3 - class method"]); // 同上一句
    
    // 4
//    NSLog(@"%@", [[NSString alloc] initWithUTF8String:"This is s4"]); // c字符串-oc字符串
//    NSLog(@"%@", [NSString stringWithUTF8String:"This is s4 - class method"]); // 同上一句
//    printf("%s", [@"oc字符串-c字符串\n" UTF8String]); // oc字符串-c字符串
    
    // 5 - 读取本地文件
//    NSString *file = @"/Users/Apple/Desktop/iOS/iOS_basic_advantage/basic/Foundation/Foundation_05/Foundation_05/main.m";
//    NSLog(@"\n%@", [[NSString alloc] initWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil]);
    
    // 6 -
//    NSString *urlPath = [[NSString alloc] initWithFormat:@"file://%@", file]; // 将 file 封装成 URL
    NSString *urlPath = @"https://www.baidu.com"; // 百度网页数据

    NSURL *url = [[NSURL alloc] initWithString:urlPath];
//    NSURL *url = [NSURL URLWithString:urlPath]; // 同上一句
//    NSURL *url = [NSURL fileURLWithPath:file]; // 同上一句
    
    NSLog(@"\n%@",  [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil]);
    
}

void fun_02() {
    // 输出到同级文件夹中, atomically : YES 成功才会创建文件
    [[NSString stringWithFormat:@"%@", [NSDate date]] writeToFile:@"/Users/Apple/Desktop/iOS/iOS_basic_advantage/basic/Foundation/Foundation_05/Foundation_05/foundation_05.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"writeToFile end");
}


// 0506
void fun_03() {
    NSMutableString *s1 = [NSMutableString stringWithFormat:@"This is NSMutableString"];
    [s1 appendString:@", appendString"];
    
    NSRange range = [s1 rangeOfString:@" is"];
    [s1 deleteCharactersInRange:range];
    
    NSString *s2 = @"This is NSString";
    NSString *s3 = [s2 stringByAppendingString:@"stringByAppendingString"]; // s3 是一个新的字符串
    
    NSLog(@"s1: %@, s2: %@, s3: %@", s1, s2, s3);
}

int main() {
    @autoreleasepool {
        
//        fun_01();
        
//        fun_02();
        
        fun_03();
        
    }
    return 0;
}



