//
//  oc_020306.m
//  
//
//  Created by sq y on 2017/7/9.
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

- (void)method;

@end


@implementation Person
 - (void)method {
    NSLog(@"call method");
}
@end


int main() {
    Person *person = [Person new];
    // 若 method 无声明 无实现 : 警告 instance method '-method' not found
    // 若 method 有声明 无实现 : 警告 method definition for 'method' not found
    // 若 method 无声明 有实现 : 没有警告没有报错, 正常运行
    [person method];
    
    return 0;
}

