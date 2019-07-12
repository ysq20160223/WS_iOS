//
//  c_0705.c
//  
//
//  Created by sq y on 2017/7/6.
//
//

/*
    01, typedef
 
    02, 
 
 
 */

#include <stdio.h>

// -------
typedef int MyInt;
typedef MyInt MyMyInt;

// -------
typedef char * String;
#define MyString char *

// -------
struct Student
{
    int age;
};
typedef struct Student MyStudent;

//
typedef struct Person
{
    char * name;
} MyPerson;

// -------
// 只能通过 Union 来访问结构体
typedef struct
{
    char * name;
} MyUnion;

// ------- 枚举

typedef enum Sex {Male, Female} MySex;

// ------- 函数指针

typedef int (*FunPoint)(int, int);

int sum(int a, int b)
{
    return a + b;
}

int minus(int a, int b)
{
    return a - b;
}


// ------- 结构体指针

typedef struct Human
{
    int age;
} * MyHuman;


// -------
void fun_01()
{
    MyInt i1 = 1;
    
    printf("i1 = %d\n", i1);
}

void fun_02()
{
    String s = "jim";
    printf("s = %s\n", s);
}

void fun_03()
{
    MyStudent myStu = {1};
    MyPerson myPer = {"root"};
    
    printf("myStu.age = %d, myPer.name = %s\n", myStu.age, myPer.name);
}

void fun_04()
{
    MyUnion myUnion = {"MyUnion"};
    MySex mySex = Male;
    
    printf("myUnion = %s, mySex = %u\n", myUnion.name, mySex);
}

void fun_05()
{
    FunPoint p1 = sum;
    FunPoint p2 = minus;
    
    printf("sum = %d, minus = %d\n", p1(1, 2), p2(2, 1));
}


// 0706
// typedef 和 define 不一样可以互换
void fun_06()
{
    String s1 = "first", s2 = "second"; // s1, s2 都是指针
    printf("sizeof(s1): %lu, sizeof(s2): %lu\n", sizeof s1, sizeof s2);
    
    //
    MyString s3 = "third", s4 = "four"; // 相当于 char *s3; char s4;
    printf("sizeof(s3): %lu, sizeof(s4): %lu\n", sizeof s3, sizeof s4);
}

int main()
{
//    fun_01();
    
//    fun_02();
    
//    fun_03();
    
//    fun_04();
    
//    fun_05();
    
    fun_06();
    
    return 0;
}


