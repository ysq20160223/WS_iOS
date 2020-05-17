//
//  UserModel.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *profile_image;
@property (nonatomic, assign) NSInteger total_cmt_like_count;
@property (nonatomic, strong) NSString *sex;

@end

NS_ASSUME_NONNULL_END
