//
//  BSTopic.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/10.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TopicModel.h"

#import "NSCalendar+X.h"
#import "NSDate+X.h"
//#import "CmtModel.h"

//#import "MJExtension.h"

@implementation TopicModel

static NSDateFormatter *fmt_;
static NSCalendar *calendar_;

+ (void)initialize {
    fmt_ = [[NSDateFormatter alloc] init];
    calendar_ = [NSCalendar xCalendar];
}

- (NSString *)created_at {
//    NSLog(@"%@", _created_at);
//    _created_at = @"2020-04-17 21:41:01";
    
    
    fmt_.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createdAtDate = [fmt_ dateFromString:_created_at];
//    NSLog(@"%@", createdAtDate)
    
//    NSLog(@"%d", createdAtDate.isThisYear);
    if (createdAtDate.isThisYear) {
        
//        NSLog(@"%d", [calendar isDateInToday:createdAtDate]);
//        NSLog(@"%d", [calendar isDateInYesterday:createdAtDate]);
        if (createdAtDate.isToday) {
            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents *components = [[NSCalendar xCalendar] components:unit fromDate:createdAtDate toDate:[NSDate date] options:0];
//            NSLog(@"%@", components);
            if (components.hour > 1) {
                return [NSString stringWithFormat:@"%ld hrs ago", components.hour];
            } else if (components.hour > 0) {
                return [NSString stringWithFormat:@"%ld hr ago", components.hour];
            } else if (components.minute > 1) {
                return [NSString stringWithFormat:@"%ld mins ago", components.minute];
            } else if (components.minute > 0) {
                return [NSString stringWithFormat:@"%ld min ago", components.minute];
            } else {
                return @"moments ago";
            }
        } else if (createdAtDate.isYesterday) {
            fmt_.dateFormat = @"HH:mm:ss";
            return [NSString stringWithFormat:@"Yesterday %@", [fmt_ stringFromDate:createdAtDate]];
        } else {
            fmt_.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt_ stringFromDate:createdAtDate];
        }
    }
    return _created_at;
}

#pragma mark - MJExtension Start
//+ (NSDictionary *)mj_objectClassInArray {
//    return @{@"top_cmt" : [CmtModel class]};
//}


// 拓展
//+ (NSDictionary *)mj_replacedKeyFromPropertyName {
//    return @{@"desc" : @"description",
//             @"ID" : @"id",
//
//             @"name" : @[@"name1", @"name2"],
//             @"other" : @"a.b[0].c",
//    };
//}


// 下划线转驼峰
//+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
//    NSMutableString *key = [NSMutableString string];
//
//    for (NSInteger i = 0; i < propertyName.length; i++) {
//        unichar c = [propertyName characterAtIndex:i];
//        if (c >= 'A' && c <= 'Z') {
//            [key appendString:@"_"];
//            [key appendFormat:@"%c", c + 32];
//        } else {
//            [key appendFormat:@"%c", c];
//        }
//    }
//    return key;
//}

//+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
//    return [propertyName mj_underlineFromCamel];
//}
#pragma mark - MJExtension End

@end


