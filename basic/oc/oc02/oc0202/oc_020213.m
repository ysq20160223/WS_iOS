//
//  oc_020213.m
//
//
//  Created by Apple on 2017/7/9.
//
//

/*
 01, 方法的声明和实现
 
 02, 计算器类
 返回 PI
 计算某个整数的平方
 计算两个整数的和
 
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"


@interface Calculator : NSObject
- (double)pi;

// oc 方法中, 一个参数对应一个冒号
- (int)power:(int)i;
- (int)sumA:(int)a andB:(int)b;
@end


@implementation Calculator
- (double)pi {
    return 3.14;
}

- (int)power:(int)i {
    return i * i;
}

- (int)sumA:(int)a andB:(int)b {
    return a + b;
}
@end


// *****************************************************
int main() {
    Calculator *calculator = [Calculator new];
    
    NSLog(@"pi: %f", [calculator pi]);
    NSLog(@"power: %d", [calculator power:9]);
    NSLog(@"sum: %d", [calculator sumA:1 andB:2]);
    
    return 0;
}


