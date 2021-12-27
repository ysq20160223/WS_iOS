//
//  oc_0107.m
//  
//
//  Created by Apple on 2017/7/8.
//
//

/*
    typedef signed char BOOL
 
    #define YES (BOOL) 1
    #define NO (BOOL) 0
 
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../PrefixHeader.pch"

int main()
{
    BOOL b = YES;
    NSLog(@"b = %i", b);
    
    return 0;
}


