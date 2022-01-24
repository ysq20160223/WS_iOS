//
//  oc_020301.m
//
//
//  Created by Apple on 2017/7/9.
//
//

/*
 01, 封装 - set
 02, 封装 - get
 03, 成员变量名的规范: 以下划线开头
 
 */


#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"

typedef enum {
    SexMale, SexFemale
} Sex;


@interface Student : NSObject {
    int _age;
    Sex _sex;
}

- (void)study;

- (void)setAge:(int)age;
- (int)age;

- (void)setSex:(Sex)sex;
- (Sex)sex;

@end



@implementation Student
- (void)study {
    NSLog(@"age: %d", _age);
}

//
- (void)setAge:(int)age {
    _age = age;
}

- (int)age {
    return _age;
}

//
- (void)setSex:(Sex)sex {
    _sex = sex;
}

- (Sex)sex {
    return _sex;
}
@end



int main() {
    Student *s = [Student new];
    [s study];
    
    [s setAge:21];
    NSLog(@"setAge %d", [s age]);
    
    // 点语法
    s.age = 30; // set
    NSLog(@".age: %d", s.age); // get
    
    return 0;
}


