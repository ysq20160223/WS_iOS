//
//  c_0701.c
//  
//
//  Created by Apple on 2017/7/6.
//
//

/*
    01, 宏定义
        所有的预处理指令都是以 # 开头
        宏名一般用大写或者以 k 开头
    02, 取消 宏定义 #undef
 
    03, 带参数的宏定义 : 参数和结果都加 ()
 
 
 */


#include <stdio.h>

#define COUNT 3

#define kSum(v1, v2) ((v1) + (v2))
#define kSquares(a) ((a) * (a))


void fun_01()
{
    int ages[COUNT] = {1, 21, 9};
    for (int i = 0; i < COUNT; i++) {
        printf("ages[%d]: %d\n", i, ages[i]);
    }
}


void fun_02()
{
    int a = 1, b = 2;
    int sum = kSum(a, b) * kSum(a, b);
    printf("sum: %d\n", sum);
}


void fun_03() {
    int squares = kSquares(3 + 1);
    printf("squares: %d\n", squares);
}


int main()
{
//    fun_01();
//    fun_02();
    fun_03();
    return 0;
}


#undef COUNT


