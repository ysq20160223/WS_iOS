//
//  Single.h
//  ios_092903
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

// .h 文件中调用
#define singleH(name) + (instancetype)share##name;


#if __has_feature(objc_arc)

// -------------------------------- ARC 情况下 .m 文件中调用 -- start
#define singleM(name) static id _instance;\
\
\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
    if (nil == _instance) {\
        @synchronized (self) {\
            if (_instance == nil) {\
                _instance = [super allocWithZone:zone];\
            }\
        }\
    }\
    return _instance;\
}\
\
\
\
+ (instancetype)share##name {\
    return [[self alloc] init];\
}\
\
\
\
- (id)mutableCopyWithZone:(NSZone *)zone {\
    return _instance;\
}\
\
\
\
- (id)copyWithZone:(NSZone *)zone {\
    return _instance;\
}
// -------------------------------- ARC 情况下 .m 文件中调用 -- end


#else


// -------------------------------- MRC 情况下 .m 文件中调用 -- start

#define singleM(name) static id _instance;\
\
\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
    if (nil == _instance) {\
        @synchronized (self) {\
            if (_instance == nil) {\
                _instance = [super allocWithZone:zone];\
            }\
        }\
    }\
    return _instance;\
}\
\
\
\
+ (instancetype)share##name {\
    return [[self alloc] init];\
}\
\
\
\
- (id)mutableCopyWithZone:(NSZone *)zone {\
    return _instance;\
}\
\
\
\
- (id)copyWithZone:(NSZone *)zone {\
    return _instance;\
}\
\
\
\
- (oneway void)release {\
    \
}\
\
\
\
- (instancetype)retain {\
    return _instance;\
}\
\
\
\
- (NSUInteger)retainCount {\
    return MAXFLOAT;\
}\
// -------------------------------- MRC 情况下 .m 文件中调用 -- end

#endif // #if __has_feature(objc_arc)


