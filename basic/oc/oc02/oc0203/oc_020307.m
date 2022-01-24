//
//  oc_020307.m
//
//
//  Created by Apple on 2017/7/9.
//
//

/*
 01, 类方法
 以 + 开头
 只能用类来调用, 如果用对象调用, 运行时出错
 类方法名 和 对象方法名 可以相同
 
 */

#import <Foundation/Foundation.h>


#define DEBUG
#import "../../../../PrefixHeader.pch"


@interface Person : NSObject
+ (void)classMethod;

//- (void)instanceMethod;
@end


@implementation Person
+ (void)classMethod {
    NSLog(@"class method");
}

- (void)instanceMethod {
    NSLog(@"instance method");
}
@end



int main() {
    //
    [Person classMethod];
    
    //
    Person *person = [Person new];
    [person instanceMethod];
//    [person classMethod]; // 对象不能调用类方法
    return 0;
}


