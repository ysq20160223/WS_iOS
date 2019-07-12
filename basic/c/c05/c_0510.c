//
//  c_0510.c
//  
//
//  Created by sq y on 2017/7/2.
//
//

/*
 
 01, 类型说明符 
        short = short int
        long = long int 输出 %ld
 
        signed 
        unsigned : 最高位不是符号位, 输出 %u
 
 02, signed / unsigned 不会改变字节大小
 
 */

#include <stdio.h>

void fun_01()
{
    char c = 65;
    
    short s = 123;
    
    int i = 12345;
    
    long int l = 1234567890L;
    
    printf("char c: %c\n", c);
    printf("short s: %d\n", s);
    printf("int i: %d\n", i);
    printf("long l: %ld\n", l);
    
    
    
    
    printf("sizeof(signed char): %lu\n", sizeof(signed char));
    printf("sizeof(unsigned char): %lu\n", sizeof(unsigned char));
    
    printf("sizeof(short): %lu\n", sizeof(short));
    printf("sizeof(unsigned short): %lu\n", sizeof(unsigned short));
    
    printf("sizeof(int): %lu\n", sizeof(int));
    printf("sizeof(long int): %lu\n", sizeof(long int));
    printf("sizeof(int): %lu\n", sizeof(int));
    printf("sizeof(unsigned int): %lu\n", sizeof(unsigned int));
    
    printf("sizeof(long): %lu\n", sizeof(long));
    printf("sizeof(long long): %lu\n", sizeof(long long));
    printf("sizeof(unsigned long): %lu\n", sizeof(unsigned long));
}

int main()
{
    fun_01();
    
    return 0;
}




