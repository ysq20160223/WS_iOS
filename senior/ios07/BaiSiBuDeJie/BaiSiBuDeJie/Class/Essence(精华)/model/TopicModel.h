//
//  BSTopic.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/10.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CmtModel;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TopicType) {
    TopicTypeAll = 1,
    TopicTypeVideo = 41,
    TopicTypeAudio = 31,
    TopicTypePic = 10,
    TopicTypeWord = 29
};

@interface TopicModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profile_image;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, assign) NSInteger ding;
@property (nonatomic, assign) NSInteger cai;
@property (nonatomic, assign) NSInteger repost;
@property (nonatomic, assign) NSInteger comment;

@property (nonatomic, strong) NSArray<CmtModel *> *top_cmt; // 最热评论

// 1: ALL
// 10: PIC
// 29: WORD
// 31: AUDIO
// 41: VIDEO
@property (nonatomic, assign) TopicType type;

@end

NS_ASSUME_NONNULL_END
