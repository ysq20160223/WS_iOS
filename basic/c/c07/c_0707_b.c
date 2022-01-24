//
//  c_0707_b.c
//  
//
//  Created by Apple on 2017/7/6.
//
//

#include "c_0707_b.h"

int a; //

// 完整声明外部函数, 默认情况下可以省略 extern
extern void fun_01()
{
    printf("call fun_01() - a = %d\n", a);
    
//    fun_02(); // 可以调用内部函数
}


static void fun_02()
{
    printf("call fun_02()\n");
}


