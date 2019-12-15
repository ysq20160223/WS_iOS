//
//  Status.h
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"


@interface Status : NSObject

@property (nonatomic, retain) NSString *content;

// 1970-01-01 00:00:00
@property (nonatomic, assign) long time;

@property (nonatomic, retain) User *user; // 当前微博的发表者

@property (nonatomic, retain) Status *retweenStatus; // 转发别人的微博

@property (nonatomic, assign) int commentsCount;

@property (nonatomic, assign) int reweetsCount;

@end


