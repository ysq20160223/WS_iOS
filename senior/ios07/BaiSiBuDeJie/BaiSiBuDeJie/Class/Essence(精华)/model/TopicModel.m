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
#import "BSConst.h"
#import "CmtModel.h"
#import "UserModel.h"

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

- (CGFloat)cellHeight {
    if (_cellHeight) {
        return _cellHeight;
    }
    
    // 1, name, created_at
    _cellHeight = BSMargin + 22 + 22 + BSMargin;
    
    // 2,
    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 * BSMargin;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
//    CGSize textSize = [self.text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:textMaxSize];
    CGSize textSize = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
    _cellHeight += textSize.height + BSMargin;
//    NSLog(@"%f", textSize.height);
    
    // 3,
    if (self.type != TopicTypeWord) {
        CGFloat imgH = textMaxW * self.height / self.width * 1;
        if (self.type == TopicTypePic && !self.is_gif && imgH > kScreenH * 0.7) {
//            NSLog(@"%@; imgH: %f, kScreenH: %f", self, imgH, kScreenH);
            imgH = kScreenH * 0.5;
            self.isBigPic = YES;
        }
        
        if (self.type == TopicTypeVideo) {
            imgH = kScreenH * 0.5;
        }
        
        self.contentRect = CGRectMake(BSMargin, _cellHeight, textMaxW, imgH);
        _cellHeight += imgH + BSMargin;
        
//        NSLog(@"%@; frame: %@", self, NSStringFromCGRect(self.contentRect));
    }
//
    // 4,
    if (self.top_cmt.count) {
        _cellHeight += 30; // User
        if (self.top_cmt[0].voiceuri.length) {
            self.top_cmt[0].content = @"[Voice Comment]";
        }
        
        NSString *topCmtContent = [NSString stringWithFormat:@"%@: %@", self.top_cmt[0].user.username, self.top_cmt[0].content];
        
        CGSize topCmtContentSize = [topCmtContent boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil].size;
        _cellHeight += topCmtContentSize.height + BSMargin;
    }
    
    //
    _cellHeight += 1 + 36 + BSMargin;
    return _cellHeight;
}


#pragma mark -
- (NSString *)description {
    return [NSString stringWithFormat:@"TopicModel[ID: %ld; name: %@; profile_image: %@; text: %@; created_at: %@; ding: %ld; cai: %ld; repost: %ld; comment: %ld; top_cmt: %@; TopicType: %ld; width: %ld; height: %ld; is_gif: %ld, smallImg: %@; middleImg: %@; largeImg: %@; cellHeight: %f; contentRect: %@; videouri: %@; voiceuri: %@]", self.ID, self.name, self.profile_image, self.text, self.created_at, self.ding, self.cai, self.repost, self.comment, self.top_cmt, self.type, self.width, self.height, self.is_gif, self.smallImg, self.middleImg, self.largeImg, self.cellHeight, NSStringFromCGRect(self.contentRect), self.videouri, self.voiceuri];
}

@end


