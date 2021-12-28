//
//  Person.m
//  oc_020528
//
//  Created by Apple on 2017/7/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)method {
    NSLog(@"OBJECT %@", NSStringFromSelector(_cmd));
}

- (void)methodWithArgs:(NSString *)args {
    NSLog(@"OBJECT %@, %@", NSStringFromSelector(_cmd), args);
}

+ (void)method {
    NSLog(@"CLASS %@", NSStringFromSelector(_cmd));
}

@end
