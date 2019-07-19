//
//  oc_020307.m
//
//
//  Created by sq y on 2017/7/9.
//
//

/*
 01, 类方法
 以 + 开头
 只能用类来调用, 如果用对象调用, 运行时出错
 类方法名 和 对象方法名 可以相同
 
 */

#import <Foundation/Foundation.h>
#import "../../../../PreHeader.h"

@interface Person : NSObject

+ (void)method;

- (void)method;

@end



@implementation Person

+ (void)method {
    NSLog(@"class method");
}

- (void)method {
    NSLog(@"obj method");
}

@end



int main() {
    //
    [Person method];
    
    //
    Person *person = [Person new];
    [person method];
    
    return 0;
}




