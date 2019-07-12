//
//  Student.h
//  oc_0310
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Car.h"
#import "Dog.h"

@interface Student : NSObject
{
    int _no;
    NSString *_name;
    Car *_car;
    Dog *_dog;
}

//
- (void) setNo:(int) no;
- (int)no;

//
- (void) setName:(NSString *)name;
- (NSString *)name;

//
- (void) setCar:(Car *)car;
- (Car *)car;

//
- (void) setDog:(Dog *)dog;
- (Dog *)dog;

@end
