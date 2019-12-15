//
//  main.m
//  oc_0314
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PrefixHeader.pch"

#import "Person.h"



int main() {
    Person *person = [[Person alloc] init];
    person.rich = YES;
    
    NSLog(@"isRich: %d", person.isRich);
    
    [person release];
    
    return 0;
}



