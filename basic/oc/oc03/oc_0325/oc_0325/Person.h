//
//  Person.h
//  oc_0325
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Dog;

@interface Person : NSObject

@property (nonatomic, assign) int age; // automatic

@property (nonatomic, strong) Dog *dog; // strong 为强指针

@end
