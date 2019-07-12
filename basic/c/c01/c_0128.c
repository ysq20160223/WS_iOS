//
//  c_0128.c
//  
//
//  Created by sq y on 2017/6/30.
//
//

/*
 
    变量的内存分析
 
    1, 内存寻址由大到小, 优先分配内存地址比较大的字节给变量
    2, 变量先定义, 内存地址越大
    3, & 是一个地址运算符
    4, %p 用来输出一个地址
    5, 一个变量一定要进行初始化才能使用
 
 */

#include <stdio.h>

int main()
{
    int i = 1;
    
    double d = 2;
    
    char c = 'c';
    
    printf("&i: %p, &d: %p, &c: %p\n", &i, &d, &c);
    
    printf("sizeof(int): %lu\n", sizeof(int));
    printf("sizeof(d): %lu\n", sizeof(d));
    
    return 0;
}
