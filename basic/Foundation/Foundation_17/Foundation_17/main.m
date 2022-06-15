//
//  main.m
//  Foundation_17
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, NSNumber 
        之所以能包装基本数据类型为对象, 是因为继承了 NSValue
 
    02, NSValue
 
 */

#import <Foundation/Foundation.h>


int main() {
    @autoreleasepool {
        NSNumber *numInt = [NSNumber numberWithInt:21]; // 基本类型转为对象
        NSNumber *numFloat = @55.5; // 等价于 [NSNumber numberWithFloat:55];
        
        //
        int _id = 21;
        NSNumber *ID = @(_id);
        NSLog(@"ID: %@", ID);
        
        //
        NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
        [mDic setObject:numInt forKey:@"age"];
        [mDic setObject:numFloat forKey:@"weight"];
        NSLog(@"%@", mDic);
        
        int age = numInt.intValue; // 将对象转化为基本数据类型
        int height = @"177".intValue; //
        NSInteger width = @"211".integerValue;
        NSLog(@"age: %d; height: %d; width: %ld", age, height, width);
        
        
        //
        CGPoint p = CGPointMake(1, 1);
        NSValue *value = [NSValue valueWithPoint:p]; // 将结构体转化为对象
        [value pointValue]; // 将对象转化为结构体
    }
    return 0;
}


