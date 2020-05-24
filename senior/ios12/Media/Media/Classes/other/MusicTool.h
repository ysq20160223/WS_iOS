//
//  MusicTool.h
//  Media
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AudioModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicTool : NSObject

+ (NSArray<AudioModel *> *)musics;

+ (AudioModel *)playingMusic;
+ (void)setupPlayingMusicModel:(AudioModel *)audioModel;

+ (AudioModel *)previousMusic;
+ (AudioModel *)nextMusic;



// 播放音乐 fileName:音乐文件
+ (AVAudioPlayer *)playMusicWithFileName:(NSString *)fileName;

// 暂停音乐 fileName:音乐文件
+ (AVAudioPlayer *)pauseMusicWithFileName:(NSString *)fileName;

// 停止音乐 fileName:音乐文件
+ (void)stopMusicWithFileName:(NSString *)fileName;

// 播放音效 soundName:音效文件
+ (void)playSoundWithSoundName:(NSString *)soundName;

@end

NS_ASSUME_NONNULL_END
