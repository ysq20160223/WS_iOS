//
//  c_0705.c
//  
//
//  Created by Apple on 2017/7/6.
//
//

#include <stdio.h>


// -------
typedef int Int;
typedef Int INT;


// ------- 0706
typedef char * String;
#define MyString char *


// -------
//struct Stu {
//    int age;
//};
//typedef struct Stu Student;

typedef struct {
    int age;
} Student;


//
//typedef struct Per {
//    char * name;
//} Person;

typedef struct {
    char *name;
} Person;


// 只能通过 Union 来访问结构体
typedef struct {
    char * name;
} StructUnion;


// ------- 枚举
//typedef enum Sex {Male, Female, Unknown} EnumSex;
typedef enum {Male, Female, Unknown} EnumSex;


// ------- 函数指针
typedef int (*FuncP)(int, int);


int sum(int a, int b) {
    return a + b;
}

int minus(int a, int b) {
    return a - b;
}


// ------- 结构体指针
typedef struct Human {
    int age;
} * StructHumanP;


// -------
void fun_01() {
    Int i = 1;
    printf("Int i: %d\n", i);
}


void fun_02() {
    String s = "jim";
    printf("String s: %s\n", s);
}


void fun_03() {
    Student s = {1};
    Person p = {"root"};
    printf("s.age: %d; p.name: %s\n", s.age, p.name);
}


void fun_04() {
    StructUnion strucUnion = {"this is StructUnion name"};
    EnumSex enumSex = Unknown;
    printf("myUnion.name: %s; mySex: %u\n", strucUnion.name, enumSex);
}


void fun_05() {
    FuncP p1 = sum;
    FuncP p2 = minus;
    printf("sum: %d; minus: %d\n", p1(1, 2), p2(2, 1));
}


// 0706
// typedef 和 define 不一定可以互换
void fun_06() {
    String s1 = "first", s2 = "second"; // s1, s2 都是指针
    printf("sizeof(s1): %lu; sizeof(s2): %lu\n", sizeof s1, sizeof s2);
    
    //
    MyString s3 = "third", s4 = "four"; // 相当于 char *s3, char s4;
    printf("sizeof(s3): %lu; sizeof(s4): %lu\n", sizeof s3, sizeof s4);
}

int main() {
    fun_01();
    printf("--------------------------------- \n\n");
    
    fun_02();
    printf("--------------------------------- \n\n");
    
    fun_03();
    printf("--------------------------------- \n\n");
    
    fun_04();
    printf("---------------------------------- \n\n");
    
    fun_05();
    printf("--------------------------------- \n\n");
    
    fun_06();
    printf("--------------------------------- \n\n");
    return 0;
}


