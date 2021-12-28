//
//  Work.m
//  oc_020510
//
//  Created by Apple on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Work.h"

@implementation Work

- (id)init {
    if(self = [super init]) {
        _name = @"user";
    }
    return self;
}

- (id)initWithName:(NSString *)name {
    if(self = [super init]) {
        _name = name;
    }
    return self;
}

@end
