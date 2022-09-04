//
//  VideoModel.m
//  Media
//
//  Created by Apple on 2022/9/4.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import "VideoTool.h"
#import "VideoModel.h"

//

#import <MJExtension.h>


@implementation VideoTool

static NSArray<VideoModel *> *_videoArray;
static VideoModel *_playingVideo;


static NSMutableDictionary *_players;


+ (void)initialize {
    if (!_videoArray) {
        _videoArray = [VideoModel mj_objectArrayWithFilename:@"Video.plist"];
    }
    
    if (!_playingVideo && _videoArray && _videoArray.count > 0) {
        _playingVideo = _videoArray[0];
    }
    
    _players = [NSMutableDictionary dictionary];
}


+ (NSArray<VideoModel *> *)videoArray {
    return _videoArray;
}

+ (VideoModel *)playingVideo {
    return _playingVideo;
}

+ (void)setupPlayingVideoModel:(VideoModel *)videoModel {
    _playingVideo = videoModel;
}


+ (VideoModel *)previousVideo {
    NSInteger index = [_videoArray indexOfObject:_playingVideo];
    index--;
    if (0 > index) {
        index = _videoArray.count - 1;
    }
    return _videoArray[index];
}

+ (VideoModel *)nextVideo {
    NSInteger index = [_videoArray indexOfObject:_playingVideo];
    index++;
    if (index >= _videoArray.count) {
        index = 0;
    }
    return _videoArray[index];
}

@end


