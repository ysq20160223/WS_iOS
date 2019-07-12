//
//  main.m
//  Foundation_12
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"

#import "Person.h"

void fun_01() {
    NSSet *set1 = [NSSet set];
    set1 = nil;
    
    NSSet *set2 = [NSSet setWithObjects:@"yy", @"jj", @"yy", @"mm", @"nn", nil];
    
    [set2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"obj: %@", obj);
    }];
}

void fun_02() {
    NSMutableSet *muSet = [NSMutableSet set];
    
    [muSet addObject:@"yy"];
    [muSet addObject:@"jj"];
    [muSet addObject:[[Person alloc] init]];
    [muSet addObject:@"mm"];
    [muSet addObject:@"nn"];
    
    
    [muSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"obj: %@", obj);
    }];
}

int main() {
    @autoreleasepool {
        
        fun_01();
        
        NSLog(@"--------");
        
        fun_02();
        
    }
    return 0;
}




