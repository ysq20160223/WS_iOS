//
//  oc_020309.m
//  
//
//  Created by Apple on 2017/7/9.
//
//



#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"


@interface Calculator : NSObject
+ (int)sumWithA:(int)a andB:(int)b;
+ (int)averageWithA:(int)a andB:(int)b;
@end


@implementation Calculator
+ (int)sumWithA:(int)a andB:(int)b {
    return a + b;
}

+ (int)averageWithA:(int)a andB:(int)b {
//    return [Calculator sumA:a andB:b] / 2;
    return [self sumWithA:a andB:b] / 2;
}
@end



int main() {
    NSLog(@"average: %d", [Calculator averageWithA:17 andB:21]);
    return 0;
}


