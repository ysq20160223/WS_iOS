//
//  c_060201.c
//  
//
//  Created by Apple on 2017/7/3.
//
//

/*
 
    01, 字符串 （以 0 结尾）
    02, ‘\0’ 的 ASCII 码是 0
 
    03, strlen: 计算字符串的字节个数, 从某个地址开始, 直到遇到\0为止(string.h文件中)
        一个汉字三个字符
    04, strlen: 计算的字符数不包括 \0
 
 */

#include <stdio.h>
#include <string.h>

void fun_01()
{
    char c01[3] = {'i', 't'}; // 是一个字符串, 字符串以 0 结尾
    char c02[] = {'i', 't'}; // 是一个字符数组
}

// ---------
void fun_02()
{
    char it[] = "it";
    char ok[] = {'o', 'k'};
    printf("fun_02: %s\n", ok);
}

void fun_03()
{
    char it[] = "it";
    char ok[3] = {'o', 'k'};
    printf("fun_03: %s\n", ok);
}
// ---------

void fun_04()
{
    printf("strlen: %ld\n", strlen("呵呵jj\0yy"));
}

int main()
{
    fun_01();
    
    fun_02();
    
    fun_03();
    
    fun_04();
    
    return 0;
}


