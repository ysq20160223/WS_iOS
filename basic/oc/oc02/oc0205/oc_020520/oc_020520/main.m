//
//  main.m
//  oc_020520
//
//  Created by Apple on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, 计算某个字符串中阿拉伯数字的个数
    
    02, 扩充对象方法
 */

#import <Foundation/Foundation.h>

//#import "../../../../../../PrefixHeader.pch"

#import "NSString+Number.h"

int main() {
    //
    NSLog(@"count: %d", [NSString numberCountOfString:@"a1b2c3d4e5f"]);
    
    //
    NSLog(@"count: %d", [@"a1b2c3d4e5f6" numberCount]);
    
    return 0;
}


