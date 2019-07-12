//
//  c_060407.c
//  
//
//  Created by sq y on 2017/7/5.
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

//
int getSum(int a, int b) {
    return a + b;
}

int main()
{
    struct Student student = {1, 21};
    struct Student *studentP = &student; // 指向结构体的指针
    
    struct Data birthday = {1990, 1, 1};
    studentP->birthday = birthday;
    
    printf("01, no = %d, age = %d \n", student.no, student.age);
    printf("02, no = %d, age = %d \n", (*studentP).no, (*studentP).age);
    
    printf("03, no = %d, age = %d, birthday = %d-%d-%d \n", studentP->no, studentP->age,
           studentP->birthday.year, studentP->birthday.month, studentP->birthday.day);
    
    
    // ----
    int (*sum)(int, int) = getSum; // 指向函数的指针
    int a = 1, b = 2;
    printf("%d + %d = %d\n", a, b, sum(a, b));
    printf("%d + %d = %d\n", a, b, (*sum)(a, b));
    
    return 0;
}


