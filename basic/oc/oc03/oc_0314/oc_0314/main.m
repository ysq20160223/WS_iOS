//
//  main.m
//  oc_0314
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *person = [[Person alloc] init];
    
    [person setRich:YES];
    
    NSLog(@"isRich = %d", [person isRich]);
    
    [person release];
    
    return 0;
}
