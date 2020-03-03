//
//  BaseBean.h
//  ios_100904
//
//  Created by Apple on 2020/3/1.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Video.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseBean : NSObject

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray *video;

@end

NS_ASSUME_NONNULL_END
