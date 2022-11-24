//
//  Person.h
//  ios01
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, assign) int age;

@property (nonatomic, strong) NSString *name;

@end


