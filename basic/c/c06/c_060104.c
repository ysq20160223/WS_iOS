//
//  c_060104.c
//  
//
//  Created by Apple on 2019/5/22.
//
//

#include <stdio.h>

void printArray(int * array) {
    int count = sizeof(array) / sizeof(int);
    for (int i = 0; i < count; i++) {
        printf("array[%d]: %d\n", i, array[i]);
    }
}

int main() {
    
    // 给数组部分赋值
    int array[5] = {[3] = 30, [sizeof(array) / sizeof(int) - 1] = 40};
    int count = sizeof(array) / sizeof(int);
    for (int i = 0; i < count; i++) {
        printf("array[%d]: %d\n", i, array[i]);
    }
    
    
    
    // 错误写法 1 : 需要在定义时定义个数 或 进行初始化
    // right in java
//    int ages[]; // error: definition of variable with array type needs an explicit size or an initializer

    
    
    // 错误写法 2 : 只能在定义时进行赋值
    // error in java
//    int ids[]; // 数组名是个地址 == 数组首元素的地址
//    ids = {1, 2};
    
    
    // 错误写法 3 : 初始化赋值情况下, [] 内必须为常量 或 省略
    // error in java
//    int num = 9;
//    int ids[num] = {0, 1, 2, 3, 4}; // error: variable-sized object may not be initialized

    
    
    // 正确写法
    // error in java
    int x = 10;
    int names[x];
    names[1] = 10;
    for (int i = 0; i < x; i++) {
        printf("names[%d]: %d\n", i, names[i]);
    }
    
    return 0;
}


