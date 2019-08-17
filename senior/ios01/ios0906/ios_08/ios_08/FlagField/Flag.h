//
//  Flag.h
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Flag : NSObject

@property (nonatomic, strong) NSString *name;

//@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) UIImage *icon;

//
+ (instancetype) flagWithDict:(NSDictionary *)dict;

@end
