//
//  User.h
//  oc_0327
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

typedef enum {
    SexMale, SexFemale
} Sex;

typedef struct {
    int year;
    int month;
    int day;
} Date;

@interface User : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *account;

@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) NSString *icon;

@property (nonatomic, assign) Sex sex;

@property (nonatomic, strong) NSString *phone;

@property (nonatomic, assign) Date date;


@end
