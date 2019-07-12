//
//  MyProtocol.h
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, 可以用来声明方法 (不能声明成员变量)
 
    02, 只要类遵守了协议, 就相当于声明了这个协议中的所有方法
 
    03, 一个协议遵守了另一个协议, 就可以拥有另一个协议的所有方法声明
 
    04, 基协议 : NSObject
 
 */

#import <Foundation/Foundation.h>

// 定义了一个协议
@protocol MyProtocol <NSObject>

// 0406
// @required 要求实现, 不实现就会发出警告

@required
- (void)requiredMethod;

@optional
- (void)optionalMethod;

@end



