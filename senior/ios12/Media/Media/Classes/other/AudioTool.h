//
//  AudioTool.h
//  Media
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>

#import "AudioModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AudioTool : NSObject

+ (NSArray<AudioModel *> *)audioArray;

+ (AudioModel *)playingAudio;
+ (void)setupPlayingAudioModel:(AudioModel *)audioModel;

+ (AudioModel *)previousAudio;
+ (AudioModel *)nextAudio;



+ (AVAudioPlayer *)playAudioWithFileName:(NSString *)fileName;
+ (AVAudioPlayer *)pauseAudioWithFileName:(NSString *)fileName;
+ (void)stopAudioWithFileName:(NSString *)fileName;
+ (void)playSoundWithSoundName:(NSString *)soundName;

@end

NS_ASSUME_NONNULL_END
