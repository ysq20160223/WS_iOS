//
//  oc_020401.m
//  
//
//  Created by sq y on 2017/7/9.
//
//

/*
    01, NSString
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"

void fun_01() {
    NSString *s = @"china";
    NSLog(@"s: %@", s);
}

void fun_02() {
    int age = 21;
    char *name = "root";
    NSString *ID = @"identity";
    NSString *s = [NSString stringWithFormat:@"age: %d, name: %s, ID: %@", age, name, ID];
    
    NSLog(@"fun_02 s: %@, ID length: %lu", s, [ID length]);
}

int main() {
    
    fun_01();
    fun_02();
    
    return 0;
}


