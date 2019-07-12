//
//  c_0127.c
//  
//
//  Created by sq y on 2017/6/30.
//
//

/*
    1, 交换变量的值
 
 */
#include <stdio.h>

// 利用第三方变量
int fun_01()
{
    int a = 1;
    int b = 2;
    int temp;
    
    printf("before a=%d, b=%i\n", a, b);
    
    temp = a;
    a = b;
    b = temp;
    
    printf("after a=%d, b=%i\n", a, b);
    
    return 0;
}

// 不利用第三方变量
int fun_02()
{
    int a = 10, b = 20;
    printf("before a=%d, b=%i\n", a, b);
    
    
    a = b - a;
    b = b - a;
    a = b + a;
    printf("after a=%d, b=%i\n", a, b);

    return 0;
}

int main()
{
    // fun_01();
    
    fun_02();
    
    return 0;
}
