//
//  oc_020306.m
//  
//
//  Created by Apple on 2017/7/9.
//
//

/*
    01, 弱语法
        oc 是在运行过程中才会检测对象有没有实现相应的方法
        c 是在链接时出错
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"


@interface Person : NSObject
- (void)test;
@end


@implementation Person
 - (void)test {
    NSLog();
}
@end



int main() {
    Person *person = [Person new];
    // 若 test 有声明 无实现
    // 若 test 无声明 无实现 : Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[Person test]: unrecognized selector sent to instance
    
    // 若 test 无声明 有实现 : 没有警告没有报错, 正常运行
    [person test];
    
    return 0;
}


