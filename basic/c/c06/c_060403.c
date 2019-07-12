//
//  c_060403.c
//  
//
//  Created by sq y on 2017/7/5.
//
//

/*
    01, 定义结构体类型 (不会分配存储空间), 只有在定义结构体变量的时候分配存储空间
 
    02, 结构体定义存储空间采用补齐算法(最大成员字节数的倍数)
 
    03, 定义结构体的三种方式
 
    04, 结构体数组
 
 */

#include <stdio.h>

/*
    定义结构体第一种方式
 */
struct Person
{
    int id;
    int age;
    char *name;
};

void fun_01()
{
    struct Person p = {.id = 21, .name = "root"};
    int count = sizeof(p); // 补齐算法: 最大字节的倍数
    printf("count = %d, &id: %p, &age: %p, &name: %p\n", count, &p.id, &p.age, &p.name);
}

/*
    060404
    定义结构体第二种方式 - 定义类型的同时定义变量
        01, 定义结构体类型
        02, 利用新定义好的类型来定义结构体变量
 */
struct Student
{
    int age;
    double height;
    char *name;
} student;

/*
    定义结构体的第三种方式 - 匿名方式
        不能重用
 */

struct
{
    int age;
} human;


// 060406
void fun_02()
{
    struct Person persons[] =
    {
        {1, 11, "jim"},
        {2, 22, "jake"},
        {3, 33, "rose"},
    };
    
//     persons[0] = {4, 44, "mike"}; // error: 只能在结构体定义的时候进行这种初始化
    persons[0].id = 111; // 只能用这种方式进行修改
    persons[0].name = "mm";
    
    for (int i = 0; i < 3; i++) {
        printf("person[%d] = {id: %d, name: %s}\n", i, persons[i].id, persons[i].name);
    }
}

int main()
{
//    fun_01();
    
    fun_02();
    
    return 0;
}





