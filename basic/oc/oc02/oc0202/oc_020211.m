//
//  oc_020211.m
//
//
//  Created by sq y on 2017/7/9.
//
//

/*
 01, 类的合理设计
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"

// *********************************************
@interface Dog : NSObject {
@public
    double weight;
}
- (void)eat;
- (void)run;
@end


@implementation Dog
- (void)eat {
    weight += 1;
    NSLog(@"eat - Dog weight = %.2f", weight);
}
- (void)run {
    weight -= 1;
    NSLog(@"run - Dog weight = %.2f", weight);
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
    Sex sex; // 性别
    Date birthdayDate;
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
    weight += 1;
    NSLog(@"eat - Student weight = %.2f", weight);
}

- (void)run {
    weight -= 1;
    NSLog(@"run - Student weight = %.2f", weight);
    
}

- (void)toString {
    NSLog(@"Sex: %d, birthdayDate: %d-%d-%d ,weight: %.2f", sex, birthdayDate.year,
          birthdayDate.month, birthdayDate.day, weight);
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
    
    Date date = {1990, 1, 1};
    
    
    Dog *dog = [Dog new];
    dog->weight = 10;
    
    
    Student *student = [Student new];
    student->weight = 50; // 成员变量
    student->sex = SexMale;
    student->birthdayDate = date; // 成员 结构体
    student->dog = dog; // 成员 对象
    
    Date *pDate = &(student->birthdayDate);
    pDate->year = 1991; // 指向结构体的指针用 -> 访问结构体定义的属性
    
    [student eat];
    [student run];
    
    [student toString];
    
    [student feedDog];
    [student walkDog];
    
    return 0;
}


