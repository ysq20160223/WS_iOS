//
//  LrcLineModel.m
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LrcLineModel.h"

@implementation LrcLineModel

- (instancetype)initWithLrcLineString:(NSString *)lrcLine {
    if (self = [super init]) {
        // [01:02.38]想你时你在天边
        NSArray *lrcArray = [lrcLine componentsSeparatedByString:@"]"];
        self.text = lrcArray[1];
        self.time = [self timeWithString:[lrcArray[0] substringFromIndex:1]];
    }
    return self;

}

+ (instancetype)lrcLineString:(NSString *)lrcLine {
    return [[self alloc] initWithLrcLineString:lrcLine];
}

- (NSTimeInterval)timeWithString:(NSString *)time {
    // 01:02.38
    NSInteger min = [[time componentsSeparatedByString:@":"][0] integerValue];
    NSInteger sec = [[time substringWithRange:NSMakeRange(3, 2)] integerValue];
    NSInteger hs = [[time componentsSeparatedByString:@"."][1] integerValue];
    return min * 60 + sec + hs * 0.01;
}

#pragma mark -
- (NSString *)description {
    return [NSString stringWithFormat:@"%f-%@", self.time, self.text];
}

@end
