//
//  Shop.h
//  ios_03020201
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *desc;

// < # a  # >

//
+ (id)shopWithName:(NSString *)name icon:(NSString *)icon desc:(NSString *)desc;

@end
