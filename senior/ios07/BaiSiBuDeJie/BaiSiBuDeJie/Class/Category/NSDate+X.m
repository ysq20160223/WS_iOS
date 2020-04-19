//
//  NSDate+X.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "NSDate+X.h"
#import "NSCalendar+X.h"

@implementation NSDate (X)


- (BOOL)isThisYear {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy";
    
    NSString *selfYear = [fmt stringFromDate:self];
    NSString *nowYear = [fmt stringFromDate:[NSDate date]];
    
    return [selfYear isEqualToString:nowYear];
}

- (BOOL)isToday {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [fmt stringFromDate:self];
    NSString *nowDay = [fmt stringFromDate:[NSDate date]];
    
    return [selfDay isEqualToString:nowDay];
}

- (BOOL)isYesterday {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [fmt stringFromDate:self];
    NSString *nowDay = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfDay];
    NSDate *nowDate = [fmt dateFromString:nowDay];
    
    NSCalendar *calendar = [NSCalendar xCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    return 0 == components.year && 0 == components.month && 1 == components.day;
}

@end


