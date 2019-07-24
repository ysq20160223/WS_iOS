//
//  main.m
//  oc_0411
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Person.h"

#import "AAgent.h"
#import "BAgent.h"

int main() {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        
        //
        p.delegate = [[AAgent alloc] init];
        [p buyTicket];
        
        //
        p.delegate = [[BAgent alloc] init];
        [p buyTicket];
    }
    return 0;
}
