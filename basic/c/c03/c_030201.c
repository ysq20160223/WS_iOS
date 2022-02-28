//
//  c_030201.c
//  
//
//  Created by Apple on 2017/7/1.
//

/*
    循环
        01, 先确定需要重复执行的操作
        02, 再确定约束条件
        03, continue 结束本次循环, 继续下次循环
        04, break 结束循环
 
 
    01, while
    02, do while
    03, for
 
 */

#include <stdio.h>

// 常规累加
int fun_01(int i) {
    int sum = 0;
    
    while(i) {
        sum += i--;
    }
    
    printf("fun_01; sum: %d\n", sum);
    
    return 0;
}

// 计算 b 的 n 次方
void fun_02(int b, int n) {
    int result = 1;
    for (int i = 0; i < n; i++) {
        result *= b;
    }
    printf("fun_02; result: %d\n", result);
}

// 递归计算 b 的 n 次方
int fun_03(int b, int n) {
    if (n == 0) {
        return 1;
    }
    return fun_03(b, n - 1) * b;
}

// 递归累加
int fun_04(int n) {
    if(n == 1) {
        return n;
    }
    return fun_04(n - 1) + n;
}


// 递归累乘
int fun_05(int n) {
    if(n == 1) {
        return n;
    }
    return fun_05(n - 1) * n;
}

int main() {
    // fun_01(10);
    
    fun_02(2, 5);
    
    printf("fun_03; result: %d\n", fun_03(2, 3));
    
    printf("fun_04; result: %d\n", fun_04(10000));
    
    printf("fun_05; result: %d\n", fun_05(5));
    
    return 0;
}



