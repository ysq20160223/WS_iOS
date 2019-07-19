//
//  NSLogHeader.h
//  
//
//  Created by Apple on 2019/6/2.
//
//

#import <Foundation/Foundation.h>



#ifndef NSLogHeader_h
#define NSLogHeader_h


#pragma mark - note 在 oc 代码中需有宏定义 DEBUG
//#define DEBUG // Edit Scheme -> run -> info -> Build Configuration


// __PRETTY_FUNCTION__ // 完整方法名(包括返回值和参数类型)
// __FUNCTION__ // 输出方法名

#ifdef DEBUG

// 不输出系统当前时间和线程
#define NSLog(FORMAT, ...) fprintf(stderr,"(%s:%d) %s:: %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __FUNCTION__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

// 输出系统当前时间和线程
//#define NSLog(fmt, ...) NSLog((@"(%s:%d) %s:: " fmt), __FILE__, __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);
//#else
//#define NSLog(FORMAT, ...) nil
//#endif


#endif /* NSLogHeader_h */

