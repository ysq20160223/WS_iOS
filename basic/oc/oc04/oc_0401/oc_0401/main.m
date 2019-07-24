//
//  main.m
//  oc_0401
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, block : 用来保存一段代码
    标示 : ^
 
    可以保存代码
    有返回值
    有形参
 
    02, block 访问外面的变量
        block 内部可以访问外面的变量
        默认情况下, block 内部不能修改外面的局部变量
        给局部变量加上 __block 关键字, 这个局部变量就可以在 block 内部修改
 
    03, typedef 定义 block
 
 */

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"


// 0401
// 没有参数没有返回值
void (^myBlock)() = ^{
    NSLog(@"this is block");
};


// 0402
// 有参数有返回值
int (^sum)(int, int) = ^(int a, int b){
    return a + b;
};

void (^printLine)(int) = ^(int n) {
    for(int i = 0; i < n; i++) {
        NSLog(@"-----");
    }
};


// 0403
// typedef
typedef int (^TypedefBlock)(int, int);

void fun_03() {
    TypedefBlock typeSum = ^(int a, int b) {
        return a + b;
    };
    
    TypedefBlock typeMinus = ^(int a, int b) {
        return a - b;
    };
    
    NSLog(@"sum: %d, minus: %d", typeSum(1, 2), typeMinus(1, 2));
}

int additive(int a, int b) {
    return a + b;
}


//
int main() {
    @autoreleasepool {
        int(*pAdditive)(int, int) = additive; // 指向函数的指针
        NSLog(@"%d + %d: %d", 1, 2, pAdditive(1, 2));
        printLine(1);
        
        
        // 0401
        myBlock();
        printLine(1);
        
        
        // 0402
        NSLog(@"sum: %d", sum(1, 2));
        printLine(1);
        
        
        // 0403
        fun_03();
    }
    return 0;
}





