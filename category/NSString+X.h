//
//  NSString+X.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/4.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (X)

- (unsigned long long)xFileSize;

//
- (NSString *)formatMediaTime:(NSTimeInterval)time;
+ (NSString *)formatMediaTime:(NSTimeInterval)time;
+ (NSString *)chineseToPinYin:(NSString *)chinese;

@end

NS_ASSUME_NONNULL_END
