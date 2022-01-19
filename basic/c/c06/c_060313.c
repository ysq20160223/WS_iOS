//
//  c_060313.c
//  
//
//  Created by Apple on 2017/7/5.
//
//

/*
    01, 返回指针的函数
    02, 指向函数的指针
 */

#include <stdio.h>

// 返回指针的函数
char * fun_01()
{
    return "jim";
}

// 指向函数的指针
void fun_02()
{
    printf("fun_02\n");
}

// 利用指向函数的指针进行求和
int sumAB(int a, int b)
{
    return a + b;
}


//
typedef int (^SumBlock)(int, int);


int main()
{
    char *name = fun_01();
    printf("name: %s\n", name);
    printf("-----------------\n");
    
    // (*p) 是固定写法, 代表指针变量 p 将来指向函数
    // 左边的 void : 代表没有返回值
    // 右边的 () : 指针变量 p 指向的函数没有形参
    void (*p)();
    
    p = fun_02;
    
    (*p)(); // 调用函数方式1
    p(); // 调用函数方式2
    
    printf("=================\n");

    
    int (*sumP)(int, int) = sumAB;
    
    int sum01 = sumP(1, 2);
    int sum02 = (*sumP)(3, 4);
    printf("sum01: %d\n", sum01);
    printf("sum02: %d\n", sum02);
    
    
    printf("-----------------\n");
    // 扩展 定义block
    // void (^block)()
    SumBlock sumBlock = ^ (int a, int b) {
        return a + b;
    };
    printf("sumBlock: %d\n", sumBlock(1, 2));
    
    return 0;
}


