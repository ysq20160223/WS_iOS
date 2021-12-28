//
//  oc_020311.m
//
//
//  Created by Apple on 2017/7/9.
//
//

/*
 01, 访问成员变量
 self 是一个指针, 指向了方法调用者
 访问当前对象的实例变量
 可以调用 对象方法 或 类方法
 */

#import <Foundation/Foundation.h>


#define DEBUG
#import "../../../../PrefixHeader.pch"

//
@interface Person : NSObject {
    int _age;
}

- (void)setAge:(int)age;
- (int)age;

- (void)method;

@end


//
@implementation Person

- (void)setAge:(int)age {
    _age = age;
}
- (int)age {
    return _age;
}

- (void)method {
    [self test];
    [Person test];
    int _age = -1;
    NSLog(@"age: %d", self->_age);
}

+ (void)test {
    NSLog(@"class Method");
}

- (void)test {
    NSLog(@"obj Method");
}

@end


//
int main() {
    Person *person = [Person new];
    [person method];
    return 0;
}


