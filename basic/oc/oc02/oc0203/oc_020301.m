//
//  oc_020301.m
//  
//
//  Created by sq y on 2017/7/9.
//
//

/*
    01, 封装 - set
    02, 封装 - get
    03, 成员变量名的规范: 以下划线开头
    04, 
 
 */


#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"


typedef enum
{
    SexMale, SexFemale
} Sex;

@interface Student : NSObject
{
    int _age;
    Sex _sex;
}

- (void) study;

- (void) setAge:(int)age;
- (int) age;

- (void) setSex:(Sex)sex;
- (Sex) sex;

@end



@implementation Student
- (void) study
{
    NSLog(@"age: %d is study", _age);
}

//
- (void) setAge:(int)age
{
    _age = age;
}
- (int) age
{
    return _age;
}

//
- (void) setSex:(Sex)sex
{
    _sex = sex;
}
- (Sex) sex
{
    return _sex;
}

@end

int main()
{

    Student *s = [Student new];
    [s setAge:21];
    [s study];
    
    int age = [s age];
    NSLog(@"age = %d", age);
    
    return 0;
}


