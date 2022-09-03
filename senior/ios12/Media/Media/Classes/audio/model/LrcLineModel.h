//
//  LrcLineModel.h
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LrcLineModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) NSTimeInterval time;

- (instancetype)initWithLrcLineString:(NSString *)lrcLine;
+ (instancetype)lrcLineString:(NSString *)lrcLine;

@end

NS_ASSUME_NONNULL_END
