//
//  NSString+Number.m
//  oc_020520
//
//  Created by Apple on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

+ (int)numberCountOfString:(NSString *)s {
    return [s numberCount];
}

- (int)numberCount {
    int count = 0;
    
    for (int i = 0; i < self.length; i++) {
        unichar c = [self characterAtIndex:i];
        if('0' <= c && c <= '9') {
            count++;
        }
    }
    return count;
}



// -----------------
//+ (int)numberCountOfString:(NSString *)s {
//    int count = 0;
//
//    for (int i = 0; i < s.length; i++) {
//        unichar c = [s characterAtIndex:i];
//        if(c >= '0' && c <= '9') {
//            count++;
//        }
//    }
//    return count;
//}
//
//- (int)numberCount {
//    return [NSString numberCountOfString:self];
//}

@end


