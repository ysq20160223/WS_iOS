//
//  Shop.h
//  ios_030304
//
//  Created by Apple on 2017/7/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) bool isSelected;

//
- (id)initWithDict:(NSDictionary *)dict;

+ (id)shopWithDict:(NSDictionary *)dict;

@end
