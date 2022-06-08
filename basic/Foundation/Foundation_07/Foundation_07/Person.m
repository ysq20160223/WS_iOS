//
//  Person.m
//  Foundation_07
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[age: %d; name: %@]", self.class, _age, _name];
}

@end


