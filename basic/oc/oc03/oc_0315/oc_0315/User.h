//
//  User.h
//  oc_0315
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

@property (nonatomic, retain, readwrite) NSString *name;

@property (nonatomic, retain) NSString *account;
@property (nonatomic, retain) NSString *password;

@property (nonatomic, retain) NSString *icon;

@property (nonatomic, assign) Sex sex;

@property (nonatomic, retain) NSString *phone;

@property (nonatomic, assign) Date date;

@end




