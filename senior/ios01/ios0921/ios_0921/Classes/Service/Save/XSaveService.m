//
//  MySaveService.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XSaveService.h"

@implementation XSaveService

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}

+ (id)objectForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

@end


