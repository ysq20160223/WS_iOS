//
//  main.m
//  Foundation_13
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, NSDictionary
        key - value
        索引 - 文字内容
 
 */

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"

void fun_01() {
    //
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"yy" forKey:@"y"];
    
    NSLog(@"%@", [dic objectForKey:@"y"]);
    
    //
    NSArray *keys = @[@"y", @"h"];
    NSArray *objects = @[@"yy", @"hh"];
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    NSLog(@"- %@", [dic1 objectForKey:@"h"]);
    
    //
    NSDictionary *dic2 = @{@"y" : @"yyy"};
    NSLog(@"-- %@", dic2[@"yy"]);
    NSLog(@"count: %ld", dic2.count);
}

void fun_02() {
    NSMutableDictionary *muDic = [NSMutableDictionary dictionary];
    
    [muDic setObject:@"yyyyy" forKey:@"y"];
    [muDic setObject:@"hhhhh" forKey:@"h"];
    [muDic setObject:@"aaaaa" forKey:@"a"];
    
//    [muDic removeObjectForKey:@"a"]; // 移除
    
    // 直接打印 Dictionary
//    NSLog(@"muDic = %@", muDic);
    
    // 遍历打印
    [muDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@ : %@", key, obj);
    }];
    
    // 遍历打印
    NSArray *key = [muDic allKeys];
    for (int i = 0; i < muDic.count; i++) {
        NSLog(@"%@ = %@", key[i], muDic[key[i]]);
    }
    
}

int main() {
    @autoreleasepool {
        
//        fun_01();
        
        fun_02();

    }
    return 0;
}





