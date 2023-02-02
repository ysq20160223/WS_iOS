//
//  AudioTool.m
//  Media
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import "AudioTool.h"
#import "AudioModel.h"

//

#import <MJExtension.h>

#

@implementation AudioTool

static NSArray<AudioModel *> *_audioArray;
static AudioModel *_playingAudio;


//
static NSMutableDictionary *_soudIDs;
static NSMutableDictionary *_players;


+ (void)load {
    [AudioListModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                @"data" : [AudioModel class],
            };
        }];
}

+ (void)initialize {
    if (!_audioArray) {
//        _audioList = [AudioModel objectArrayWithFilename:@"Audio.plist" error:nil];
//        _audioArray = [AudioModel mj_objectArrayWithFilename:@"Audio.plist"];
        
        NSString *audioListPath = [NSBundle.mainBundle pathForResource:@"audio_list.json" ofType:nil];
//        NSLog(@"%@", audioList);
        
        AudioListModel *audioListModel = [AudioListModel mj_objectWithKeyValues:[NSData dataWithContentsOfFile:audioListPath]];
//        NSLog(@"%@", audioListModel);
        
        _audioArray = audioListModel.data;
        for (AudioModel *audioModel in _audioArray) {
            audioModel.nameNoSuffix = [[audioModel.url stringByReplacingOccurrencesOfString:@"media/audio/" withString:@""] stringByReplacingOccurrencesOfString:@".mp3" withString:@""];
        }
//        NSLog(@"%@", _audioArray);
    }
    
    if (!_playingAudio && _audioArray && _audioArray.count > 0) {
        _playingAudio = _audioArray[0];
    }
    
    _soudIDs = [NSMutableDictionary dictionary];
    _players = [NSMutableDictionary dictionary];
}


+ (NSArray<AudioModel *> *)audioArray {
    return _audioArray;
}

+ (AudioModel *)playingAudio {
    return _playingAudio;
}

+ (void)setupPlayingAudioModel:(AudioModel *)audioModel {
    _playingAudio = audioModel;
}


+ (AudioModel *)previousAudio {
    NSInteger index = [_audioArray indexOfObject:_playingAudio];
    index--;
    if (0 > index) {
        index = _audioArray.count - 1;
    }
    return _audioArray[index];
}

+ (AudioModel *)nextAudio {
    NSInteger index = [_audioArray indexOfObject:_playingAudio];
    index++;
    if (index >= _audioArray.count) {
        index = 0;
    }
    return _audioArray[index];
}

//
+ (AVAudioPlayer *)playAudioWithFileName:(NSString *)fileName {
    // 1.创建空的播放器
    AVAudioPlayer *player = nil;
    
    [_players removeAllObjects];
    // 2.从字典中取出播放器
    player = _players[fileName];
    
    // 3.判断播放器是否为空
    if (player == nil) {
        // 4.生成对应音乐资源
        NSURL *fileUrl = [NSBundle.mainBundle URLForResource:fileName withExtension:nil];
        if (fileUrl == nil) return nil;
        
        // 5.创建对应的播放器
        player = [AVAudioPlayer.alloc initWithContentsOfURL:fileUrl error:nil];
        
        // 6.保存到字典中
        [_players setObject:player forKey:fileName];
        
        // 7.准备播放
        [player prepareToPlay];
    }
    
    // 8.开始播放
//    [player play];
    
    return player;
}

+ (AVAudioPlayer *)pauseAudioWithFileName:(NSString *)fileName {
    // 1.从字典中取出播放器
    AVAudioPlayer *player = _players[fileName];
    
    // 2.暂停音乐
    if (player) {
        [player pause];
    }
    
    return player;
}

+ (void)stopAudioWithFileName:(NSString *)fileName {
    // 1.从字典中取出播放器
    AVAudioPlayer *player = _players[fileName];
    
    // 2.停止音乐
    if (player) {
        [player stop];
        [_players removeObjectForKey:fileName];
        player = nil;
    }
}

+ (void)playSoundWithSoundName:(NSString *)soundName {
    // 1.创建soundID = 0
    SystemSoundID soundID = 0;
    
    // 2.从字典中取出soundID
    soundID = [_soudIDs[soundName] unsignedIntValue];;
    
    // 3.判断soundID是否为0
    if (soundID == 0) {
        // 3.1生成soundID
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        if (url == nil) return;
        
        AudioServicesCreateSystemSoundID(url, &soundID);
        
        // 3.2将soundID保存到字典中
        [_soudIDs setObject:@(soundID) forKey:soundName];
        
    }
    
    // 4.播放音效
    AudioServicesPlaySystemSound(soundID);
}


@end
