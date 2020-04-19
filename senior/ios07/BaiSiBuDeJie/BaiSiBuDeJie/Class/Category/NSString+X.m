//
//  NSString+X.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/4.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "NSString+X.h"

@implementation NSString (X)

- (unsigned long long)xFileSize {
    unsigned long long size = 0;
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    BOOL isDirectory = NO;
    [fileMgr fileExistsAtPath:self isDirectory:&isDirectory];
    NSDictionary *dict = [fileMgr attributesOfItemAtPath:self error:nil];
    
    if (isDirectory) {
        NSArray *array = [fileMgr subpathsAtPath:self];
        for (int i = 0; i < array.count; i++) {
            NSString *fullPath = [self stringByAppendingPathComponent:array[i]];
            size += [fileMgr attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    } else {
        size = dict.fileSize;
    }
    
    return size;
}

@end
