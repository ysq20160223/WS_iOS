//
//  Contact.h
//  ios_04
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *phone;

+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;

@end
