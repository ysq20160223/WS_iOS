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
    char c = 'c';
    int i = 1;
    long l = 2;
    
    float f = 3;
    double d = 4;
    
    
    
    printf("&c: %p\n", &c);
    printf("&i: %p\n", &i);
    printf("&l: %p\n", &l);
    printf("&f: %p\n", &f);
    printf("&d: %p\n", &d);
    
    
    printf("sizeof(char): %lu\n", sizeof(c));
    printf("sizeof(int): %lu\n", sizeof(i));
    printf("sizeof(long): %lu\n", sizeof(l));
    printf("sizeof(float): %lu\n", sizeof(f));
    printf("sizeof(double): %lu\n", sizeof(d));
    
    return 0;
}


