//
//  main.m
//  Foundation_07
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, NSArray : 不可变数组
        NSMutableArray : 可变数组
 
    02, oc 数组只能存放 oc 对象, 不能存放非 oc 对象类型
        nil 是数组元素结束的标记
        oc 数组不能存放 nil
 
    03, 
 
 */

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"

#import "Person.h"

void printNSArray(NSArray *array, NSString *arrayName) {
//    for(int i = 0; i < array.count; i++) {
////        NSLog(@"%@[%d] = %@", arrayName, i, [array objectAtIndex:i]);
//        NSLog(@"%@[%d]: %@", arrayName, i, array[i]); // 常用 - 相当于上一句
//    }
    
    // 0508
    for (id obj in array) {
        NSLog(@"%@[%lu]: %@", arrayName, [array indexOfObject:obj], obj);
    }
}



void fun_01() {
    NSArray *array = [NSArray array]; // 永远是个空数组
    NSArray *array1 = [NSArray arrayWithObject:@"hh"];
    NSArray *array2 = [NSArray arrayWithObjects:@"a", @"b", nil];
    NSArray *array3 = @[@"aa", @"bb", @"cc"]; // 常用 - 编译器新特性
    
    printNSArray(array1, @"array1");
    NSLog(@"---");
    printNSArray(array2, @"array2");
    NSLog(@"---");
    printNSArray(array3, @"array3");
    
}

void fun_02() {
    NSArray *array = @[@"aaa", [[Person alloc] init], @"bbb"];
    
    // 每遍历到一个元素, 就会调用一次 block
    // 并且把当前元素和索引位置当作参数传给 block
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(idx == 1){
            *stop = YES;
        }
        NSLog(@"enumerateObjectsUsingBlock, idx: %ld, obj: %@", idx, obj);
    }];

    
    // ------- 对 enumerateObjectsUsingBlock 内部实现分析 -- start
    void (^block)(id, NSUInteger, BOOL *) = ^(id obj, NSUInteger idx, BOOL *stop){
        if(idx == 1){
            *stop = YES;
        }
        NSLog(@"block, idx: %ld, obj: %@", idx, obj);
    };
    
    for (int i = 0; i < array.count; i++) {
        BOOL isStop = NO;
        id obj = array[i];
        block(obj, i, &isStop);
        
        if (isStop) {
            break;
        }
    }
    // ------- 对 enumerateObjectsUsingBlock 内部实现分析 -- end
    
}

int main() {
    @autoreleasepool {
        
//        fun_01();
        
        fun_02();
        
    }
    return 0;
}




