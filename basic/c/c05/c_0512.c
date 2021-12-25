//
//  c_0512.c
//  
//
//  Created by Apple on 2017/7/2.
//
//

/*
    01, 位运算
 
    02, 按位与 : 获取某一位的值
 
    03, 按位或
 
    04, 按位异或
        实现两个数的交换
        
    05, 左移 : 有可能改变正负值
 
    06, 右移
 
    07, 输出一个数的二进制数据
        思路 : 用位移 + 位与
 
 */


#include <stdio.h>

void fun_01()
{
    int i = 1;
    
    int a = 30, b = 31, c = 32;
    
    printf("i << %d = %d\n", a, i << a);
    printf("i << %d = %d\n", b, i << b);
    printf("i << %d = %d\n", c, i << c);
}

// 交换两个数
void fun_02()
{
    int a = 1;
    int b = 2;
    
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
    
    printf("a = %d, b = %d\n", a, b);
}

// 三目运算符输出奇偶数
void fun_03(int i)
{
    i % 2 ? printf("%d 是奇数\n", i) : printf("%d 是偶数\n", i);
}

// 位与判断奇偶性
void fun_04(int i)
{
    i & 1 ? printf("%d 是奇数\n", i) : printf("%d 是偶数\n", i);
}

int main()
{
    
    // fun_01();
    
    // fun_02();
    
    fun_03(30);
    
    fun_04(21);
    
    return 0;
}


