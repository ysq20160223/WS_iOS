//
//  c_0521.c
//  
//
//  Created by sq y on 2017/7/2.
//
//

/*
    01, 字符
    
    02, ‘0’ : 48
    03, 'A' : 65
    04, 'a' : 97
 
    05, 一个汉字三个字节
    
 
 */

#include <stdio.h>

void fun_01()
{
    char c1 = '0';
    char c2 = 'A';
    char c3 = 'a';
    char c4 = '\n';
    
    int i = 65;
    
    printf("c1 = %d\n", c1);
    printf("c2 = %d\n", c2);
    printf("c3 = %d\n", c3);
    printf("c4 = %d\n", c4);
    
    printf("i = %c\n", i);
}

// 小写转大写
char fun_02(char c)
{
    if (c >= 'a' && c <= 'z')
    {
        return c - ('a' - 'A');
    }
    
    return c;
}


int main()
{
    fun_01();
    
    
    char c = 'a';
    printf("%c toUpper is %c\n", c, fun_02(c));
    
    return 0;
}


