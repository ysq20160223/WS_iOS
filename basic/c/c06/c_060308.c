//
//  c_060308.c
//  
//
//  Created by Apple on 2017/7/4.
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
    
    printf("sizeof(cp): %zd\n", sizeof(cp));
    printf("sizeof(ip): %zd\n", sizeof(ip));
    printf("sizeof(lp): %zd\n", sizeof(lp));
}

//
void fun_02()
{
    int i = 2;      // 0000 0000 // 0x7ffeea471b1f
                    // 0000 0000 // 0x7ffeea471b1e
                    // 0000 0000 // 0x7ffeea471b1d
                    // 0000 0010 // 0x7ffeea471b1c
    printf("&i: %p\n", &i); // 0x7ffeea471b1c
    
    char c = 1;     // 0000 0001
    printf("&c: %p\n", &c); // 0x7ffeea471b1b
    
    int *ip = &c;
    char *cp = &c;
    
    // 2 ^ 0 = 1
    // 2 ^ 1 = 2
    // 2 ^ 2 = 4
    // 2 ^ 3 = 8
    // 2 ^ 4 = 16
    // 2 ^ 5 = 32
    // 2 ^ 6 = 64
    // 2 ^ 7 = 128
    // 2 ^ 8 = 256
    // 2 ^ 9 = 512
    printf("*ip: %d\n", *ip);
    printf("*cp: %d\n", *cp);
}

void fun_03()
{
    int j = 0;
    printf("&j: %p\n", &j);
    
    int x = 0x08060401;
    printf("&x: %p\n", &x);
    
    char *cp = &x;
    for (int i = 0; i < 4; i++) {
        printf("%p; %d\n", cp + i, *(cp + i));
    }
}

int main()
{
//    fun_01();
//    fun_02();
    fun_03();

    return 0;
}


