//
//  NSDate+X.h
//
//  Created by Apple on 2020/4/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (X)

- (BOOL)isThisYear;

- (BOOL)isToday;

- (BOOL)isYesterday;

@end

NS_ASSUME_NONNULL_END
