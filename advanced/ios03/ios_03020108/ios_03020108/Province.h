//
//  Province.h
//  ios_03020108
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

@property (nonatomic, copy) NSString *header;

@property (nonatomic, copy) NSString *footer;

@property (nonatomic, strong) NSArray *cities;

//
+ (id)provinceWithHeader:(NSString *)header footer:(NSString *)footer cities:(NSArray *)cities;

@end
