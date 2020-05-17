//
//  IOSPerson.m
//  ios_112408
//
//  Created by Apple on 2018/3/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "IOSPerson.h"

#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

@implementation IOSPerson

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
