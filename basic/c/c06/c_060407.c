//
//  c_060407.c
//  
//
//  Created by Apple on 2017/7/5.
//
//

/*
    01, 指向结构体的指针
 
    02, 利用指针访问结构体的成员
        (*p).成员名称
        p->成员名称
 
    03, 结构体嵌套定义
 
 */

#include <stdio.h>


struct Data {
    int year;
    int month;
    int day;
};


struct Student {
    int _id;
    int age;
    
    struct Data date; // 嵌套定义
};


int main() {
    struct Student student = {1, 21};
    struct Student *sp = &student; // 指向结构体的指针
    
    struct Data date = {2018, 10, 5};
    sp->date = date;
    printf("_id: %d; age: %d \n", student._id, student.age);
    
    
    student._id = 10; // 通过结构体变量修改
    student.age = 210;
    printf("_id: %d; age: %d \n", (*sp)._id, (*sp).age);
    
    
    (*sp)._id = 100;
    sp->age = 2100; //
    sp->date.year = 2022;
    printf("_id: %d; age: %d; date: %d-%d-%d \n", sp->_id, sp->age, sp->date.year, sp->date.month, sp->date.day);
    
    struct Data *dp = &sp->date;
    printf("year: %d; month: %d; day: %d\n", dp->year, dp->month, dp->day);
    
    return 0;
}


