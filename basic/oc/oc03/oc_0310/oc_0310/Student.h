//
//  Student.h
//  oc_0310
//
//  Created by Apple on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"
#import "Dog.h"

@interface Student : NSObject {
    NSString *_name;
    Car *_car;
    Dog *_dog;
}

@property int no;

- (id)initWithNo:(int)no;

- (id)initWithNo:(int)no andName:(NSString *)name;

//
- (void)setName:(NSString *)name;
- (NSString *)name;

//
- (void)setCar:(Car *)car;
- (Car *)car;

//
- (void)setDog:(Dog *)dog;
- (Dog *)dog;

@end


