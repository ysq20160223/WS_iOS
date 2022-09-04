//
//  VideoModel.h
//  Media
//
//  Created by Apple on 2022/9/4.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VideoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoTool : NSObject

+ (NSArray<VideoModel *> *)videoArray;

+ (VideoModel *)playingVideo;
+ (void)setupPlayingVideoModel:(VideoModel *)videoModel;

+ (VideoModel *)previousVideo;
+ (VideoModel *)nextVideo;

@end

NS_ASSUME_NONNULL_END
