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


int main()
{
    
    struct Person p1 = {.name = "yy", .height = 1.7};
    struct Person p2 = {21, 2.1, "yyy"};
    
    printf("age: %d, height: %f, name: %s\n", p1.age, p1.height, p1.name);
    printf("age = %d, height = %f, name = %s\n", p2.age, p.height, p.name);

    return 0;
}
