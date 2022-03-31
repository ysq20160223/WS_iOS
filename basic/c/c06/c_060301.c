//
//  c_060301.c
//  
//
//  Created by Apple on 2017/7/4.
//
//

/*
    01, 指针 (变量类型 *变量名)
    02, 指针变量只能存储地址
    03, 指针变量占用八个字节
 
    04, 二级指针
    05, 利用指针同时返回多个值
 
 */

#include <stdio.h>

// 二级指针
int main() {
    
    int i = 1;
    printf("i: %d\n", i);
    
    int *p = &i;
    *p = 2;
    printf("i: %d\n", i);
    
    int **pp = &p;
    **pp = 3;
    printf("i: %d\n", i);
    
    return 0;
}


