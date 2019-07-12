//
//  Employee.m
//  oc_020510
//
//  Created by sq y on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (id)initWithNo:(int)no {
    if(self = [super init]) {
        _no = no;
    }
    return self;
}

// 将 name 传递父类进行初始化
- (id)initWithNo:(int)no andName:(NSString *)name {
    if(self = [super initWithName:name]) {
        _no = no;
    }
    return self;
}

@end
