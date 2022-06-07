//
//  main.m
//  Foundation_01
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, NSRange(location, length)
        NSPoint/CGPoint
        NSSize/CGSize
        NSRect/CGRect
    
    02, Next Step - Foundation
 
 
 */

#import <Foundation/Foundation.h>

//#import "../../../../PrefixHeader.pch"


// 0501
void fun_01() {
//    NSRange r1 = {2, 4}; // 不用
//    NSRange r2 = {.location = 2, .length = 4}; // 不用
    
    NSLog(@"%@", NSStringFromRange(NSMakeRange(1, 21))); // 掌握
}


// 0502
void fun_02() {
    NSRange r = [@"oc foundation" rangeOfString:@"fou"];
    NSLog(@"location: %ld; length: %lu", r.location, r.length);
}


// 0503
void fun_03() {
    //
    NSLog(@"CGPoint: %@", NSStringFromPoint(CGPointMake(1, 1)));
    NSLog(@"NSPoint: %@", NSStringFromPoint(NSMakePoint(2, 2)));
    NSLog(@"-----------------------");
    
    //
    NSLog(@"CGSize: %@", NSStringFromSize(CGSizeMake(100, 100)));
    NSLog(@"NSSize: %@", NSStringFromSize(NSMakeSize(200, 200)));
    NSLog(@"-----------------------");
    
    // 0504
    CGRect r = {{1, 2}, {100, 200}};
    NSLog(@"x: %.2f; y: %.2f; width: %.2f; height: %.2f", r.origin.x, r.origin.y, r.size.width, r.size.height);
    NSLog(@"CGRect: %@", NSStringFromRect(r));
    NSLog(@"-----------------------");
    
    //
    NSLog(@"CGRect: %@", NSStringFromRect(CGRectMake(1, 1, 100, 100)));
    
//    CGPointZero == CGPointMake(0, 0); // 表示原点
//    CGSizeZero
//    CGRectZero
}

CGRect myRect(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect rect;
    rect.origin.x = x;
    rect.origin.y = y;
    rect.size.width = width;
    rect.size.height = height;
    return rect;
}

// 0504
void fun_04() {
    NSLog(@"CGPointEqualToPoint: %d", CGPointEqualToPoint(CGPointMake(0, 1), CGPointMake(2, 3)));
    NSLog(@"CGSizeEqualToSize: %d", CGSizeEqualToSize(CGSizeMake(100, 200), CGSizeMake(300, 400)));
    NSLog(@"CGRectEqualToRect: %d", CGRectEqualToRect(CGRectMake(0, 1, 100, 200), CGRectMake(2, 3, 300, 400)));
    NSLog(@"CGRectContainsPoint: %d", CGRectContainsPoint(CGRectMake(10, 10, 100, 100), CGPointMake(50, 50)));
}

//
int main() {
    @autoreleasepool {
        fun_01();
        XLog
        
        fun_02();
        XLog
        
        fun_03();
        XLog
        
        fun_04();
    }
    return 0;
}


