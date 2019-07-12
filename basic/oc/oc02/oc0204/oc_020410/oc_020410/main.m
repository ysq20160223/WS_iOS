//
//  main.m
//  oc_020410
//
//  Created by sq y on 2017/7/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"

#import "../../../../../../PreHeader.h"

int main() {
    
    NSLog(@"xcode oc");
    
    Student *student = [Student new];
    
    [student setAge:21];
    
    NSLog(@"age = %d", [student age]);
    
    return 0;
}
