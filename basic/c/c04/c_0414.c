//
//  c_0414.c
//  
//
//  Created by Apple on 2017/7/1.
//
//

/*
    01, 一个中文汉字三个字节
    02, \n 是一个换行字符
    03, printf 返回是字符串常量的字符数, 并不是字数
    
 
 */

#include <stdio.h>

int main()
{

    printf("chinese = %d\n", printf("中国\n"));
    
    printf("letter = %d\n", printf("A\n"));
    
    printf("number = %d\n", printf("21\n"));
    
    return 0;
}


