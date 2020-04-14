//
//  BSTopic.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/10.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopicModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profile_image;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, assign) NSInteger ding;
@property (nonatomic, assign) NSInteger cai;
@property (nonatomic, assign) NSInteger repost;
@property (nonatomic, assign) NSInteger comment;

@end

NS_ASSUME_NONNULL_END
