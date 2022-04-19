//
//  c_0704_a.c
//  
//
//  Created by Apple on 2017/7/6.
//
//

/*
    01, 文件包含
 
    02, 要同时编译两个文件 : cc c_0704_a.c c_0704_b.c
 
    03, 以文件名为宏名
 
 */

#include <stdio.h>

#include "c_0704_b.h"

int main() {
    printf("sum: %d\n", sum(1, 2));
    return 0;
}


