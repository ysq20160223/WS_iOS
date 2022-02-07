//
//  Person.m
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

#import "../../../../../PrefixHeader.pch"

#import "MyProtocol.h"
#import "MyProtocol_A.h"
#import "MyProtocol_B.h"

@implementation Person

- (void)requiredMethod {
    NSLog();
}


// ------
- (void)requiredMethodA {
    NSLog();
}

- (void)optionalMethod {
    NSLog();
}

//-----
- (void)requiredMethodB {
    NSLog();
}

@end


