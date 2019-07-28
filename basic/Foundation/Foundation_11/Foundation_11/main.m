//
//  main.m
//  Foundation_11
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, NSMutableArray
 
 */

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"

#import "Person.h"

int main() {
    @autoreleasepool {
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"yy", @"jj", @"hh", nil]; // 初始化 - 添加元素
        //    NSMutableArray *array = @[@"yy", @"jj"]; // error: 返回是 NSArray *
        
        [array addObject:[[Person alloc] init]];
        [array addObject:@"xx"];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"idx: %ld, obj: %@", idx, obj);
        }];
        
        [array removeObjectAtIndex:3]; // 移除
        
        NSLog(@"----------------");
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"idx: %ld, obj: %@", idx, obj);
        }];
    
    }
    return 0;
}





