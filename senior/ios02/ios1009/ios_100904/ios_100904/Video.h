//
//  Audio.h
//  ios_100904
//
//  Created by Apple on 2020/3/1.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *albumPic;


+ (instancetype)videoWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
