//
//  oc_020309.m
//  
//
//  Created by sq y on 2017/7/9.
//
//

/*
 
 */

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"



@interface Calculator : NSObject

+ (int)sumA:(int)a andB:(int)b;

+ (int)averageA:(int)a andB:(int)b;

@end



@implementation Calculator

+ (int)sumA:(int)a andB:(int)b
{
    return a + b;
}

+ (int)averageA:(int)a andB:(int)b
{
//    return [Calculator sumA:a andB:b] / 2;
    return [self sumA:a andB:b] / 2;
}

@end




int main()
{
    NSLog(@"average: %d", [Calculator averageA:17 andB:21]);
    
    return 0;
}




