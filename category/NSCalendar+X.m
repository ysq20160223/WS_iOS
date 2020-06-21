//
//  NSCalendar+X.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "NSCalendar+X.h"

@implementation NSCalendar (X)

+ (instancetype)xCalendar {
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}

@end


