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





// ---
@interface Dog : NSObject
{
    @public
    double weight;
}
- (void) eat;
- (void) run;
@end


@implementation Dog
- (void) eat
{
    weight += 1;
    NSLog(@"eat - Dog weight = %.2f", weight);
}
- (void) run
{
    weight -= 1;
    NSLog(@"run - Dog weight = %.2f", weight);
}
@end


// ---
typedef enum
{
    SexMale, SexFemale
} Sex;

typedef struct
{
    int year;
    int month;
    int day;
} Data;

// ---
@interface Student : NSObject
{
    @public
    Sex sex; // 性别
    Data birthday;
    double weight;
    Dog *dog;
}
- (void) eat;
- (void) run;
- (void) feedDog;
- (void) walkDog;
- (void) toString;
@end

@implementation Student
- (void) eat
{
    weight += 1;
    NSLog(@"eat - Student weight = %.2f", weight);
}
- (void) run
{
    weight -= 1;
    NSLog(@"run - Student weight = %.2f", weight);
    
}
- (void) toString
{
    NSLog(@"Sex: %d, birthday: %d-%d-%d ,weight: %.2f", sex, birthday.year,
          birthday.month, birthday.day, weight);
}
- (void) feedDog
{
    [dog eat];
}
-(void) walkDog
{
    [dog run];
}
@end

int main()
{

    Student *student = [Student new];
    student->sex = SexMale;
    student->weight = 50;
    
    Data data = {1990, 1, 1};
    student->birthday = data;
    
    Dog *dog = [Dog new];
    dog->weight = 10;
    student->dog = dog;
    
    [student eat];
    [student run];
    
    [student toString];
    
    [student feedDog];
    [student walkDog];
    
    
    return 0;
}


