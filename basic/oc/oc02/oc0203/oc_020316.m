//
//  oc_020316.m
//
//
//  Created by Apple on 2017/7/9.
//
//

/*
 01, 不允许子类和父类有相同的成员变量
 02, 子类可以父类有相同的 成员方法／类方法 - 重写/覆盖
 
 03, 继承 和 组合
 
 04, super
 直接调用父类中的某个方法
 子类重写父类的方法时想保留父类的一些行为
 
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"

// ********************************
@interface Person : NSObject {
    int _age;
}
- (void)setAge:(int)age;
- (int)age;

- (void)run;
@end


@implementation Person
- (void)setAge:(int)age {
    _age = age;
}

- (int)age {
    return _age;
}

- (void)run {
    NSLog(@"Person run");
}
@end


// ********************************
@interface Student : Person
@end


@implementation Student
// 重写
- (void)run {
    [super run];
    NSLog(@"Student run");
}
@end


// ********************************
int main() {
    Student *student = [Student new];
    [student run];
    return 0;
}


