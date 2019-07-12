//
//  Person.m
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

#import "../../../../../PreHeader.h"

#import "MyProtocol.h"
#import "MyProtocol_01.h"
#import "MyProtocol_02.h"

@implementation Person

- (void)requiredMethod {
    NSLog(@"");
}


// ------
- (void)requiredMethod_01 {
    NSLog(@"");
}

- (void)optionalMethod {
    NSLog(@"");
}

//-----
- (void)requiredMethod_02 {
    NSLog(@"");
}

@end
