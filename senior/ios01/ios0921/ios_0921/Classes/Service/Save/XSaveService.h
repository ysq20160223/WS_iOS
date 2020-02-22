//
//  MySaveService.h
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSaveService : NSObject

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

+ (nullable id)objectForKey:(NSString *)defaultName;

@end
