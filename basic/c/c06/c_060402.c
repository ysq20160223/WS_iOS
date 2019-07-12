//
//  c_060402.c
//  
//
//  Created by sq y on 2017/7/5.
//
//

/*
    01, 结构体
        可以由多个不同类型的数据构成
    02, 结构体类型, 定义结构体变量

 */


#include <stdio.h>

struct Person
{
    int age;
    double height;
    char *name;
};

void fun_01()
{
    struct Person p = {.name = "yy", .height = 1.7, .age = 30};
    struct Person p = {21, 2.1, "yyy"};
    
    printf("age = %d, height = %f, name = %s\n", p.age, p.height, p.name);
}

int main()
{
    fun_01();
    
    return 0;
}
