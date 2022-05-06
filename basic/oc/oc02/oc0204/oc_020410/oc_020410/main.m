//
//  main.m
//  oc_020410
//
//  Created by Apple on 2017/7/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"

int main() {
    
    Student *student = Student.new;
    [student setAge:21];
    
    NSLog(@"age: %d", [student age]);
    
    return 0;
}


