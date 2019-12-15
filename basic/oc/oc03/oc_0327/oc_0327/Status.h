//
//  Status.h
//  oc_0327
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"

@interface Status : NSObject

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSString *icon;

// 1970-01-01 00:00:00
@property (nonatomic, assign) long time;

@property (nonatomic, strong) User *user;

@property (nonatomic, strong) Status *retweenStatus;

@property (nonatomic, assign) int commentsCount;

@property (nonatomic, assign) int reweetsCount;

@end
