//
//  c_060309.c
//  
//
//  Created by Apple on 2017/7/5.
//
//

/*
    01, 指针和数组
    02, 数组名就是数组的地址, 也是首元素地址
 
    03, 数组元素的访问方式
        1, 数组名[下标]
        2, 指针变量名[下标]
        3, *指针变量名
 
 */
 

#include <stdio.h>

int main() {
    long ages[] = {9, 21, 30, 1};
    long *p = ages; // 等价于 int *p = &ages[0]
    int count = sizeof(ages) / sizeof(long);
    
    for (int i = 0; i < count; i++) {
        printf("ages[%d]: 0x%lx\t%p\n", i, *(p + i), p + i); // 3, *指针变量名
    }
    printf("---------------------------\n");
    
    for (int i = 0; i < count; i++) {
        printf("ages[%d]: %ld\n", i, p[i]); // 2, 指针变量名[下标]
    }
    printf("===========================\n");
    
    for (int i = 0; i < count; i++) {
        printf("ages[%d]: %ld\n", i, ages[i]); // 1, 数组名[下标]
    }
    
    return 0;
}


