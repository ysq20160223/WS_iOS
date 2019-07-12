//
//  c_060308.c
//  
//
//  Created by sq y on 2017/7/4.
//
//

/*
    01, 任何指针类型都占用 8 个字节空间
 
 */

#include <stdio.h>

// 指针变量占用的字节空间
void fun_01()
{
    char c;
    int i;
    long l;
    
    char *cp = &c;
    int *ip = &i;
    long *lp = &l;
    
    printf("sizeof(cp) = %zd\n", sizeof(cp));
    printf("sizeof(ip) = %zd\n", sizeof(ip));
    printf("sizeof(lp) = %zd\n", sizeof(lp));
}

//
void fun_02()
{
    int i = 2;
    
    char c = 1;
    
    
    int *ip = &c;
    char *cp = &c;
    
    printf("*ip = %d\n", *ip);
    printf("*cp = %d\n", *cp);
}

int main()
{
//    fun_01();
    
//    fun_02();
    
    //
    int i = 0x08060401;
    
    char *cp = &i;
    for (int i = 0; i < 4; i++) {
        printf("%p, %d\n", cp + i, *(cp + i));
    }

    return 0;
}




