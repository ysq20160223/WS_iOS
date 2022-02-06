//
//  Student.h
//  oc_0321
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"


@interface Student : Person

@property (nonatomic, assign) int money;

+ (id)studentWithAge:(int)age andMoney:(int)money;

@end


