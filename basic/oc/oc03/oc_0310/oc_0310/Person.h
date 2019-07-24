//
//  Person.h
//  oc_0310
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Car.h"

@interface Person : NSObject {
    Car *_car;
}

@property NSInteger age;

- (id)initWithAge:(NSInteger)age;

- (void)setCar:(Car *)car;
- (Car *)car;

@end
