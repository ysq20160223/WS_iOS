//
//  Student.m
//  oc_0321
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Student.h"

#import "../../../../../PrefixHeader.pch"


@implementation Student

+ (id)studentWithAge:(int)age andMoney:(int)money {
    Student *student = [self personWithAge:age];
    student.money = money;
    return student;
}

- (void)dealloc {
    NSLog(@"money: %d", _money);
    [super dealloc];
}

@end
