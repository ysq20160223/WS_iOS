//
//  Person.h
//  oc_0321
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject

@property (nonatomic, assign) int age;

+ (id)person;

+ (id)personWithAge:(int) age;

@end


