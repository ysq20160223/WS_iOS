//
//  Tools.m
//  ios_092902
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Tools.h"

@implementation Tools

static Tools *_instance;

// 单例模式
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // 1
//    if(_instance == nil) {
//        @synchronized (self) {
//            if(_instance == nil) {
//                _instance = [super allocWithZone:zone];
//                
//            }
//        }
//    }
    
    // 2
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

// ---
+ (instancetype)shareTools {
    return [[self alloc] init];
}

// --- 严谨起见
- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}
// --- 严谨起见

@end


