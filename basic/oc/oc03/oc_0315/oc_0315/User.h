//
//  User.h
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    SexMale, SexFemale
} Sex;

typedef struct {
    int year;
    int month;
    int day;
} Date;



@interface User : NSObject

@property (nonatomic, retain, readwrite) NSString *userName;

@property (nonatomic, retain) NSString *headPortrait; // 用户头像

@property (nonatomic, assign) Sex sex;

@property (nonatomic, assign) Date date;

@end


