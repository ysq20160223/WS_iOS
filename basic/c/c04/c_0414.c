//
//  c_0414.c
//  
//
//  Created by sq y on 2017/7/1.
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
    int len = printf("中国\n");
    
    printf("len = %d\n", len);
    
    return 0;
}
