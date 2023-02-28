//
//  NSArray+X.m
//
//  Created by Apple on 2020/10/11.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "NSArray+X.h"

@implementation NSArray (X)
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *s = [NSMutableString stringWithString:@"["];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [s appendFormat:@"\t%@, ", obj];
    }];
    [s appendString:@"]"];
    return s;
}
@end



@implementation NSDictionary (X)
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *s = [NSMutableString stringWithString:@"{\n"];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [s appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [s appendString:@"}"];
    return s;
}
@end


