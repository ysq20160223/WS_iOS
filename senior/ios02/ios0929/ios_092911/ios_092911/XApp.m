//
//  MyApp.m
//  ios_092911
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XApp.h"

@implementation XApp

+ (instancetype)appWithDict:(NSDictionary *)dict {
    XApp *app = [[XApp alloc] init];
    
    [app setValuesForKeysWithDictionary:dict];
    
    return app;
}

@end
