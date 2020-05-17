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
@property (nonatomic, strong) NSString *like_count;
@property (nonatomic, strong) NSString *voicetime;
@property (nonatomic, strong) NSString *voiceuri;
@property (nonatomic, assign) NSInteger ID;


// add
@property (nonatomic, assign) NSInteger index;

@end

NS_ASSUME_NONNULL_END
