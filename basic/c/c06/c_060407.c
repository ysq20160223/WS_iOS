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

struct Data
{
    int year;
    int month;
    int day;
};

struct Student
{
    int no;
    int age;
    
    struct Data birthday; // 嵌套定义
};


int main()
{
    struct Student student = {1, 21};
    struct Student *studentP = &student; // 指向结构体的指针
    
    struct Data birthday = {1990, 1, 1};
    studentP->birthday = birthday;
    printf("no: %d, age: %d \n", student.no, student.age);
    
    
    student.no = 11; // 通过结构体变量修改
    printf("no: %d, age: %d \n", (*studentP).no, (*studentP).age);
    
    
    (*studentP).no = 111;
    studentP->age = 211; // 
    studentP->birthday.year = 2019;
    printf("no: %d, age: %d, birthday: %d-%d-%d \n", studentP->no, studentP->age,
           studentP->birthday.year, studentP->birthday.month, studentP->birthday.day);
    
    struct Data *pData = &studentP->birthday;
    printf("year: %d, month: %d, day: %d\n", pData->year, pData->month, pData->day);
    
    return 0;
}


