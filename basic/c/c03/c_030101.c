//
//  c_030101.c
//  
//
//  Created by Apple on 2017/7/1.
//
//

/*
 
    01, if
    02, if / else
    03, if / else if / else
    04, if 省略花括号情况
 
 */
 

#include <stdio.h>

int fun_01()
{
    int i = 1;
    
    // 把常量写在左边可以预防错误
    if(0 == i)
    {
        printf("i == 0\n");
    }
    else
    {
        printf("i != 0\n");
    }
    
    return 0;
}

int fun_02()
{
    /* */
//    if(10 > 0)
//        int a = 1; // 作用域不明确
    
    return 0;
}

int main()
{

    fun_01();
    
//     fun_02();
    
    return 0;
}


