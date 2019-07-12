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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        
        //
        AAgent *aAgent = [[AAgent alloc] init];
        p.delegate = aAgent;
        [p buyTicket];
        
        //
        BAgent *bAgent = [[BAgent alloc] init];
        p.delegate = bAgent;
        [p buyTicket];
        
    }
    return 0;
}
