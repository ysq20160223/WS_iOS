//
//  Tools.m
//  ios_092903
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Tools.h"

@implementation Tools


singleM(Tools)

//static Tools *_instance;
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    if (_instance == nil) {
//        @synchronized (self) {
//            if (_instance == nil) {
//                _instance = [super allocWithZone:zone];
//            }
//        }
//    }
//    return _instance;
//}
//
////
//+ (instancetype)shareTools {
//    return [[self alloc] init];
//}
//
//// --
//- (id)mutableCopyWithZone:(NSZone *)zone {
//    return _instance;
//}
//
//- (id)copyWithZone:(NSZone *)zone {
//    return _instance;
//}
//// --



// 条件编译
//#if __has_feature(objc_arc)
//    // ARC
//
//#else
//
//// --- MRC 情况下
//- (oneway void)release {
//    
//}
//
//- (instancetype)retain {
//    return _instance;
//}
//
//// 约定
//- (NSUInteger)retainCount {
//    return MAXFLOAT;
//}
//// --- MRC 情况下
//
//#endif



@end


