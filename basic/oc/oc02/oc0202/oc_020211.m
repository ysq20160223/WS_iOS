//
//  oc_020211.m
//
//
//  Created by Apple on 2017/7/9.
//
//

/*
 01, 类的合理设计
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"

@interface Dog : NSObject {
@public
    double weight;
}
- (void)eat;
- (void)run;
@end


@implementation Dog
- (void)eat {
    NSLog(@"weight: %.2f", ++weight);
}

- (void)run {
    NSLog(@"weight: %.2f", --weight);
}
@end



// *********************************************
typedef enum {
    SexMale, SexFemale
} Sex;

typedef struct {
    int year;
    int month;
    int day;
} Date;



// *********************************************
@interface Student : NSObject {
@public
    Sex sex;
    Date date;
    double weight;
    Dog *dog;
}
- (void)eat;
- (void)run;
- (void)feedDog;
- (void)walkDog;
- (void)toString;
@end


@implementation Student
- (void)eat {
    NSLog(@"weight: %.2f", ++weight);
}

- (void)run {
    NSLog(@"weight: %.2f", --weight);
}

- (void)toString {
    NSLog(@"Sex: %d; date: %d-%d-%d; weight: %.2f", sex, date.year, date.month, date.day, weight);
}

- (void)feedDog {
    [dog eat];
}

-(void)walkDog {
    [dog run];
}
@end



// *********************************************
int main() {
    
    Date date = {2018, 10, 5};
    
    
    Dog *dog = [Dog new];
    dog->weight = 10;
    
    
    Student *student = [Student new];
    student->weight = 50; // 成员变量
    student->sex = SexMale;
    student->date = date; // 成员 结构体
    student->dog = dog; // 成员 对象
    
    Date *pDate = &(student->date);
    pDate->year = 1991; // 指向结构体的指针用 -> 访问结构体定义的属性
    
    [student eat];
    [student run];
    
    [student toString];
    
    [student feedDog];
    [student walkDog];
    
    return 0;
}


