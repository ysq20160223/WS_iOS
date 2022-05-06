
#import "NSCalendar+X.h"

@implementation NSCalendar (X)

#pragma mark -
+ (instancetype)xCalendar {
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return NSCalendar.currentCalendar;
    }
}

+ (NSDateFormatter *)dateFormat:(NSString *)format {
    NSDateFormatter *formatter = NSDateFormatter.alloc.init;
    formatter.dateFormat = format;
    return formatter;
}


#pragma mark -
// 间隔当前时间 hour 的时间戳
+ (long)xHourGap:(NSInteger)hour {
    NSDateComponents *dateComponents = NSDateComponents.alloc.init;
    [dateComponents setHour:hour];
    NSDate *newdate = [NSCalendar.xCalendar dateByAddingComponents:dateComponents toDate:NSDate.date options:0];
    return (long)[newdate timeIntervalSince1970] * 1000;
}

// 两个时间戳间隔 second
+ (NSInteger)xSecondGapWithStart:(NSInteger)startTimestamp andEnd:(NSInteger)endTimestamp {
    return (endTimestamp - startTimestamp) / 1000;
}

// 两个时间戳间隔 hour
+ (NSInteger)xHourGapWithStart:(NSInteger)startTimestamp andEnd:(NSInteger)endTimestamp {
    return (endTimestamp - startTimestamp) / 1000 / 60 / 60;
}

// 两个时间戳间隔 day
+ (NSInteger)xDayGapWithStart:(NSInteger)startTimestamp andEnd:(NSInteger)endTimestamp {
    return (endTimestamp - startTimestamp) / 1000 / 24 / 60 / 60;
}

// 间隔当前时间 day 的时间戳
+ (long)xDayGap:(NSInteger)day {
    NSDateComponents *dateComponents = NSDateComponents.alloc.init;
    dateComponents.day = day;
    NSDate *newdate = [NSCalendar.xCalendar dateByAddingComponents:dateComponents toDate:NSDate.date options:0];
    return (long)[newdate timeIntervalSince1970] * 1000;
}


+ (long)xDayGap:(NSInteger)day andIsStart:(BOOL)isStart andIsEnd:(BOOL)isEnd {
    NSDateComponents *dateComponents = NSDateComponents.alloc.init;
    [dateComponents setDay:day];
    NSDate *newdate = [NSCalendar.xCalendar dateByAddingComponents:dateComponents toDate:NSDate.date options:0];
    long timestamp = (long)[newdate timeIntervalSince1970] * 1000;
    if (isStart) {
        NSString *times = [self xTimestamp:timestamp format:@"yyyy-MM-dd"];
        return [self xTime:[NSString stringWithFormat:@"%@ 00:00:00", times] format:@"yyyy-MM-dd HH:mm:ss"];
    } else if (isEnd) {
        NSString *times = [self xTimestamp:timestamp format:@"yyyy-MM-dd"];
        return [self xTime:[NSString stringWithFormat:@"%@ 23:59:59", times] format:@"yyyy-MM-dd HH:mm:ss"];
    }
    return timestamp;
}

#pragma mark -
+ (NSString *)xWeek:(long)timestamp {
    NSDate *date= [NSDate dateWithTimeIntervalSince1970:timestamp / 1000];
    NSCalendar *gregorian = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:date];
    NSInteger _weekday = weekdayComponents.weekday;
    NSString *weekStr;
    if (_weekday == 1) {
        weekStr = @"星期日";
    } else if (_weekday == 2) {
        weekStr = @"星期一";
    } else if (_weekday == 3) {
        weekStr = @"星期二";
    } else if (_weekday == 4) {
        weekStr = @"星期三";
    } else if (_weekday == 5) {
        weekStr = @"星期四";
    } else if (_weekday == 6) {
        weekStr = @"星期五";
    } else if (_weekday == 7) {
        weekStr = @"星期六";
    }
    return weekStr;
}


#pragma mark -
+ (NSString *)xTimestamp:(long)timestamp format:(NSString *)format {
    NSDate *date = [NSDate.alloc initWithTimeIntervalSince1970:timestamp / 1000];
    NSDateFormatter *formatter = NSDateFormatter.alloc.init;
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

+ (NSString *)xTimestamp:(long)timestamp {
    return [self xTimestamp:timestamp format:@"yyyy-MM-dd HH:mm:ss"];
}


#pragma mark -
+ (NSDate *)xGetDateByTimestamp:(long)timestamp {
    return [NSDate.alloc initWithTimeIntervalSince1970:timestamp / 1000];
}


#pragma mark -
+ (long)xTime:(NSString *)s format:(NSString *)format {
    NSDateFormatter *dateFormatter = NSDateFormatter.alloc.init;
    dateFormatter.dateFormat = format;
    NSDate *date = [dateFormatter dateFromString:s];
    return (long)[date timeIntervalSince1970] * 1000;
}

+ (long)xTime:(NSString *)s {
    NSDateFormatter *dateFormatter = NSDateFormatter.alloc.init;
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [dateFormatter dateFromString:s];
    return (long)[date timeIntervalSince1970] * 1000;
}


#pragma mark -
// 当前时间戳
+ (long)xNow {
    return (long)[NSDate.date timeIntervalSince1970] * 1000;
}


#pragma mark -
// 根据 NSDate 获取时间戳
+ (long)xDate:(NSDate *)date {
    return (long)[date timeIntervalSince1970] * 1000;
}

#pragma mark -
// 获取时间戳 day
+ (NSInteger)xDay:(long)timeStamp {
    NSDateComponents *components = [NSCalendar.xCalendar components:NSCalendarUnitDay fromDate:[NSCalendar xGetDateByTimestamp:timeStamp]];
    return components.day;
}

// 获取时间戳 hour
+ (NSInteger)xHour:(long)timeStamp {
    NSDateComponents *components = [NSCalendar.xCalendar components:NSCalendarUnitHour fromDate:[NSCalendar xGetDateByTimestamp:timeStamp]];
    return components.hour;
}

// 获取时间戳 minute
+ (NSInteger)xMinute:(long)timeStamp {
    NSDateComponents *components = [NSCalendar.xCalendar components:NSCalendarUnitMinute fromDate:[NSCalendar xGetDateByTimestamp:timeStamp]];
    return components.minute;
}

// 获取时间戳 second
+ (NSInteger)xSecond:(long)timeStamp {
    NSDateComponents *components = [NSCalendar.xCalendar components:NSCalendarUnitSecond fromDate:[NSCalendar xGetDateByTimestamp:timeStamp]];
    return components.second;
}

@end


