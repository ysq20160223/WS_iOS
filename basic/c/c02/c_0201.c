//
//  c_0201.c
//
//
//  Created by Apple on 2017/6/30.
//
//

/*
 
 1, 算术运算符 （+ - * ／）
 2, 取余运算 % 两边都是整数
 3, 取余结果的正负性只跟左边的数值有关
 
 */

#include <stdio.h>


int fun_01()
{
    int a = -10 % 3;
    int b = -10 % -3;
    int c = 10 % 3;
    int d = 10 % -3;
    
    printf("a: %d; b: %i; c: %i; d: %i\n", a, b, c, d);
    return 0;
}

int fun_02()
{
    double d = 10 / 3;
    printf("d: %f\n", d);
    return 0;
}

int main()
{
    fun_01();
    
    fun_02();
    
    return 0;
}


