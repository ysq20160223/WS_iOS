//
//  c_060310.c
//  
//
//  Created by Apple on 2017/7/5.
//
//

/*
    01, 指针和字符串
 
    02, 常量区: 存放常量字符串
    03, 堆: 存放对象
    04, 栈: 存放局部变量

    05, 定义字符串的两种方式
        利用数组 : 字符串里面的字符是可以改变的 (变量)
        利用指针 : 是一个字符串常量
 
    06, 字符串数组
 
    07, 字符串输入
 
 */


#include <stdio.h>
#include <string.h>

// 060310
// 指针和字符串
void fun_01()
{
    char name1[] = "it"; // 字符串变量
    char name2[] = "it";
    char name3[] = {'I', 'T'};
    printf("&name1: %p; &name2: %p; name2: %s; name3: %s\n", &name1, &name2, name2, name3);
    
    char *cp1 = "ok"; // 字符串常量, 不可更改
    char *cp2 = "ok";
    printf("cp1: %p; cp2: %p\n", cp1, cp2); // 地址一致
}


// 060311
// 字符串数组
void fun_02()
{
    char *name[] = {"jim", "green"};
    printf("%lu\n", strlen(name));
    for (int i = 0; i < strlen(name); i++) {
        printf("name[%d]: %s\n", i, name[i]);
    }
}

// 字符串输入
void fun_03()
{
    char name[20];
    printf("input name: ");
    scanf("%s", name); // 把输入的字符串放到字符数组里面
    printf("name: %s\n", name);
}

// 输入一个字符
void fun_04()
{
    char c;
    printf("input a char: ");
    scanf("%c", &c); // 把输入的字符串放到字符数组里面
    printf("c: %c\n", c);
}

int main()
{
     fun_01();
//    fun_02();
//    fun_03();
//    fun_04();
    return 0;
}


