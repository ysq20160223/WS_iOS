//
//  MyApp.h
//  ios_092911
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XApp : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *download;

//
+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
