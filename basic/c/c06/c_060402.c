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

struct Person {
    int _id;
    double height;
    char *name;
};


void fun01() {
    struct Person p1 = {.name = "j", .height = 162.0, ._id = 1};
    struct Person p2 = {21, 170.0, "y"};
    
    printf("_id: %d; height: %f; name: %s\n", p1._id, p1.height, p1.name);
    printf("_id: %d; height: %f; name: %s\n", p2._id, p2.height, p2.name);
}


// 结构体赋值等于为各个属性赋值
void fun02() {
    struct Person p1 = {1, 162, "jj"};
    struct Person p2 = {21, 170, "yy"};
    p2 = p1;
    p2.height = 161;
    
    printf("_id: %d; height: %f; name: %s\n", p1._id, p1.height, p1.name);
    printf("_id: %d; height: %f; name: %s\n", p2._id, p2.height, p2.name);
}

int main() {
    fun01();
    printf("-------------\n");
    
    fun02();
    return 0;
}


