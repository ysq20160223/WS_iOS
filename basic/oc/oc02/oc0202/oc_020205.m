//
//  oc_020205.m
//
//
//  Created by Apple on 2017/7/8.
//
//

/*
 01, 方法与成员变量
 
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"

// 1, 声明
@interface Person : NSObject {
@public
    int age;
    double weight;
}
- (void)walk;
@end



// 2, 实现
@implementation Person
- (void)walk {
    NSLog(@"age: %d, weight: %.2f, call walk method", age, weight);
}
@end



int main() {
    Person *person = [Person new];
    person->age = 21;
    person->weight = 55;
    
    [person walk];
    return 0;
}


