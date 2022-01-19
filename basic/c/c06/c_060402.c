//
//  c_060402.c
//  
//
//  Created by Apple on 2017/7/5.
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

void fun01() {
    struct Person p1 = {.name = "j", .height = 1.0, .age = 1};
    struct Person p2 = {21, 2.1, "y"};
    
    printf("age: %d; height: %f; name: %s\n", p1.age, p1.height, p1.name);
    printf("age: %d; height: %f; name: %s\n", p2.age, p2.height, p2.name);
}

// 结构体赋值等于为各个属性赋值
void fun02() {
    struct Person p1 = {1, 1.62, "jj"};
    struct Person p2 = {21, 1.7, "yy"};
    p2 = p1;
    p2.age = 9;
    
    printf("age: %d; height: %f; name: %s\n", p1.age, p1.height, p1.name);
    printf("age: %d; height: %f; name: %s\n", p2.age, p2.height, p2.name);
}

int main()
{
    fun01();
    printf("-------------\n");
    
    fun02();
    return 0;
}


