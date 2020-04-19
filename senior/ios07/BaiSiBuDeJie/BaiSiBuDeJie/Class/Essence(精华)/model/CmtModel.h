//
//  CmtModel.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

NS_ASSUME_NONNULL_BEGIN

@interface CmtModel : NSObject

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) UserModel *user;

@end

NS_ASSUME_NONNULL_END
