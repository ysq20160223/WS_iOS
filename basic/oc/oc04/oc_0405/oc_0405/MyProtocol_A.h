//
//  MyProtocol_01.h
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyProtocol_A <NSObject>

// @required 要求实现, 不实现就会发出警告

@required
- (void)requiredMethodA;

@optional
- (void)optionalMethodA;


@end
