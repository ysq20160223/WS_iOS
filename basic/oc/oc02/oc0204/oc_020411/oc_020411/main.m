//
//  main.m
//  oc_020411
//
//  Created by Apple on 2017/7/10.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    代码段: 选中要删除的代码段, 按 delete 删除
 */

#import <Foundation/Foundation.h>

#import "Person.h"


int main() {
    Person *person = Person.new;
    [person setName:@"yy"];
    [person setAge:21];
    NSLog(@"name: %@; age: %d", [person name], [person age]);
    
    person.name = @"jj";
    person.age = 1;
    NSLog(@"name: %@; age: %d", person.name, person.age);
    
    return 0;
}


