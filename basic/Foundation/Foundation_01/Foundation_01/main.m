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
        NSSIze/CGSize
        NSRect/CGRect
    
    02, Next Step - Foundation
 
 
 */

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"

// 0501
void fun_01() {
    NSRange r1 = {2, 4}; // 不用
    NSRange r2 = {.location = 2, .length = 4}; // 不用
    NSRange r3 = NSMakeRange(2, 4); // 掌握
    
}


// 0502
void fun_02() {
    NSString *str = @"oc foundation";
    
    NSRange range = [str rangeOfString:@"foq"];
    
    NSLog(@"location: %ld, length: %lu", range.location, range.length);
}


// 0503
void fun_03() {
    //
    CGPoint p1 = NSMakePoint(1, 1);
    NSPoint p2 = CGPointMake(2, 2); // 常用
    
    NSLog(@"CGPoint p1 = %@", NSStringFromPoint(p1));
    NSLog(@"NSPoint p2 = %@", NSStringFromPoint(p2));
    NSLog(@"-----------------------");
    
    //
    NSSize s1 = CGSizeMake(100, 100);
    NSSize s2 = NSMakeSize(200, 200);
    CGSize s3 = NSMakeSize(300, 300);
    
    NSLog(@"NSSize s1 = %@", NSStringFromSize(s1));
    NSLog(@"NSSize s2 = %@", NSStringFromSize(s2));
    NSLog(@"CGSize s3 = %@", NSStringFromSize(s3));
    NSLog(@"-----------------------");
    
    // 0504
    CGRect r1 = CGRectMake(1, 1, 100, 100);
    
    NSLog(@"x: %f, y: %f, width: %f, height: %f", r1.origin.x, r1.origin.y, r1.size.width, r1.size.height);
    NSLog(@"CGRect r1 = %@", NSStringFromRect(r1));
    NSLog(@"-----------------------");
    
    //
    CGRect r2 = {{1, 2}, {100, 200}};
    CGRect r3 = {p1, s2};
    
    NSLog(@"CGRect r2: %@", NSStringFromRect(r2));
    NSLog(@"CGRect r3: %@", NSStringFromRect(r3));

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

//
void fun_04() {
    // 0504
    BOOL b1 = CGPointEqualToPoint(CGPointMake(0, 1), CGPointMake(2, 3));
    
    BOOL b2 = CGSizeEqualToSize(CGSizeMake(100, 200), CGSizeMake(300, 400));
    
    BOOL b3 = CGRectEqualToRect(CGRectMake(0, 1, 100, 200), CGRectMake(2, 3, 300, 400));

    NSLog(@"CGRectContainsPoint = %d", CGRectContainsPoint(CGRectMake(10, 10, 100, 100), CGPointMake(50, 50)));

}

//
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        fun_02();
        
        fun_03();
        
//        fun_04();
        
    }
    return 0;
}





