//
//  c_030210.c
//  
//
//  Created by sq y on 2017/7/1.
//

/*
    01, for 循环
    02, for 循环 () 中的作用域比 {} 作用域广
    03, java 中不能定义和 () 中相同的变量,
 
 */

#include <stdio.h>

int fun_01()
{
    for (int i = 0; i < 3; i++) { // a++ 错误, 作用域
        int i = 1; // 在 java 中不可以定义
        int a = 2;
        printf("i: %d\n", i);
        
    }
    return 0;
}

int fun_02()
{
    for (int i = 0; i < 5; i++) {
        for(int j = i; j < 5; j++) {
            printf("*");
        }
        printf("\n");
    }
    return 0;
}

int fun_03(int x)
{
    for (int i = 1; i <= x; i++) {
        for(int j = 1; j <= i; j++) {
            printf("%d * %d: %d\t", j, i, i * j);
        }
        printf("\n");
    }
    return 0;
}

int main()
{
    fun_01();
    
    // fun_02();
    
    // fun_03(9);
}




