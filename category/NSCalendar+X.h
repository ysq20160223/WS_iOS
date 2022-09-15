//
//  NSCalendar+X.h
//
//  Created by Apple on 2020/4/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
;
@interface NSCalendar (X)

+ (instancetype)xCalendar;
+ (NSDateFormatter *)dateFormat:(NSString *)format;


#pragma mark -
+ (long)xHourGap:(NSInteger)hour;
+ (long)xDayGap:(NSInteger)day;
+ (long)xDayGap:(NSInteger)day andIsStart:(BOOL)isStart andIsEnd:(BOOL)isEnd;

// 两个时间戳间隔 second
+ (NSInteger)xSecondGapWithStart:(NSInteger)startTimestamp andEnd:(NSInteger)endTimestamp;

// 两个时间戳间隔 hour
+ (NSInteger)xHourGapWithStart:(NSInteger)startTimestamp andEnd:(NSInteger)endTimestamp;

// 两个时间戳间隔 day
+ (NSInteger)xDayGapWithStart:(NSInteger)startTimestamp andEnd:(NSInteger)endTimestamp;


#pragma mark -
+ (NSString *)xWeek:(long)timestamp;


#pragma mark -
+ (NSString *)xTimestamp:(long)timestamp format:(NSString *)format;
+ (NSString *)xTimestamp:(long)timestamp;


#pragma mark -
+ (NSDate *)xGetDateByTimestamp:(long)timestamp;


#pragma mark -
/// 根据 时间字符串 与 格式 返回 时间戳
+ (long)xTime:(NSString *)s format:(NSString *)format;
+ (long)xTime:(NSString *)s;


#pragma mark -
/// 返回当前时间戳
+ (long)xNow;


#pragma mark -
/// 根据 NSDate 与 格式 返回 时间戳
+ (long)xDate:(NSDate *)date;


#pragma mark -
+ (NSInteger)xDay:(long)timeStamp;
+ (NSInteger)xHour:(long)timeStamp;
+ (NSInteger)xMinute:(long)timeStamp;
+ (NSInteger)xSecond:(long)timeStamp;


@end

NS_ASSUME_NONNULL_END
