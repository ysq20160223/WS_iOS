//
//  c_0412_a.c
//  
//
//  Created by Apple on 2017/7/1.
//
//

/*
    01, 编译 : cc -c c_0412_a.c c_0412_b.c ,分别生成 .o 文件
    02, 同时链接 : cc c_0412_a.o c_0412_b.o
    03, 运行 : ./a.out
 */


#include <stdio.h>

int main()
{
    int i = average(2, 8);
    
    printf("average = %d\n", i);
    
    return 0;
}


