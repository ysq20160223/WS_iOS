//
//  Provinces.h
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Provinces : NSObject

@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSString *name;


//
+ (instancetype)provincesWithDict:(NSDictionary *)dict;


@end
