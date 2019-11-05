//
//  c_060302.c
//  
//
//  Created by Apple on 2019/5/26.
//
//

#include <stdio.h>

// 通过指针改值
void changeValue(int *p, int i) // * 表示定义 int 类型的指针变量
{
    printf("sizeof(p) = %lu\n", sizeof(p));
    *p = i; // * 表示访问指针变量所存储的地址的值
}

int main()
{
    int i = 0;
    
    changeValue(&i, 1);
    
    printf("i: %d\n", i);

    return 0;
}
