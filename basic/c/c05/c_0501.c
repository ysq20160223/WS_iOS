 //
//  c_0501.c
//  
//
//  Created by sq y on 2017/7/1.
//
//

/*
    01, 进制 （二进制, 八进制, 十进制, 十六进制）
    02, 二进制 : 以 0b／0B 开头
    03, 八进制 : 以 0 开头, %o 输出
    04, 十六进制 : 以 0x／0X 开头, %x 输出
    
    05, int 四个字节
    06, char 一个字节
    07, long 八个字节
    08, 0.089 = .089
    09, 21f : error ; float 类型左边只能是小数
    10, 10e2.1 : error ;
 
 
 
    note: 一个字节八位, int 占用四个字节
 */


#include <stdio.h>

int main()
{
    float a = .017;
    printf("float : %d\n", a);
    
    
    
    return 0;
}

