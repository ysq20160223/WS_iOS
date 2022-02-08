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
    return [NSString stringWithFormat:@"Person[age: %d; name: %@]", _age, _name];
}

@end


