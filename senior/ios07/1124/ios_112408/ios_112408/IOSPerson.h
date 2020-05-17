//
//  IOSPerson.h
//  ios_112408
//
//  Created by Apple on 2018/3/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOSPerson : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) void (^block)();

@end


