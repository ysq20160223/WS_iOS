//
//  Contact.m
//  ios_04
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone {
    Contact *c = [[self alloc] init];
    c.name = name;
    c.phone = phone;
    return c;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Contact[name = %@, phone = %@]", _name, _phone];
}

@end
