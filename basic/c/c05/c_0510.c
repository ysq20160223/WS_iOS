//
//  c_0510.c
//  
//
//  Created by Apple on 2017/7/2.
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


int main() {
    char c = 65;
    
    short s = 123;
    
    int i = 12345;
    
    long int l = 1234567890L;
    
    printf("char c: %c\n", c);
    printf("short s: %d\n", s);
    printf("int i: %d\n", i);
    printf("long l: %li\n", l);
    
    
    printf("signed char: %lu\n", sizeof(signed char));
    printf("unsigned char: %lu\n", sizeof(unsigned char));
    
    printf("short: %lu\n", sizeof(short));
    printf("unsigned short: %lu\n", sizeof(unsigned short));
    
    printf("int: %lu\n", sizeof(int));
    printf("unsigned int: %lu\n", sizeof(unsigned int));
    
    printf("long: %lu\n", sizeof(long));
    printf("unsigned long: %lu\n", sizeof(unsigned long));

    
    return 0;
}


