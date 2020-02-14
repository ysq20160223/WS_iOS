//
//  MyApp.m
//  ios_092911
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyApp.h"

@implementation MyApp

+ (instancetype)appWithDict:(NSDictionary *)dict {
    MyApp *app = [[MyApp alloc] init];
    
    [app setValuesForKeysWithDictionary:dict];
    
    return app;
}

@end
