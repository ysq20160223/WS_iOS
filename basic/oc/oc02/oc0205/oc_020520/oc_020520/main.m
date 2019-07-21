//
//  main.m
//  oc_020520
//
//  Created by sq y on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, 计算某个字符串中阿拉伯数字的个数
    
    02, 扩充对象方法
 */

#import <Foundation/Foundation.h>

#import "../../../../../../PreHeader.h"

#import "NSString+Number.h"

int main() {
    
    int count = [NSString numberCountOfString:@"a1b2c3d4e5f"];
    NSLog(@"count: %d", count);
    
    //
    count = [@"a1b2c3d4e5f6" numberCount];
    NSLog(@"count: %d", count);
    
    return 0;
}
