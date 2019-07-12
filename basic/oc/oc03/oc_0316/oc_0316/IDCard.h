//
//  IDCard.h
//  oc_0316
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

@class Person;

@interface IDCard : NSObject

@property (nonatomic, assign) Person *person; // 这里不能用 retain

@end
