//
//  MusicTool.m
//  Media
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import "MusicTool.h"
#import "AudioModel.h"

//

#import <MJExtension.h>


@implementation MusicTool

static NSArray<AudioModel *> *_musics;
static AudioModel *_playingMusic;


//
static NSMutableDictionary *_soudIDs;
static NSMutableDictionary *_players;


+ (void)initialize {
    if (!_musics) {
        _musics = [AudioModel objectArrayWithFilename:@"Musics.plist" error:nil];
    }
    
    if (!_playingMusic && _musics && _musics.count > 0) {
        _playingMusic = _musics[0];
    }
    
    _soudIDs = [NSMutableDictionary dictionary];
    _players = [NSMutableDictionary dictionary];
}


+ (NSArray<AudioModel *> *)musics {
    return _musics;
}

+ (AudioModel *)playingMusic {
    return _playingMusic;
}

+ (void)setupPlayingMusicModel:(AudioModel *)audioModel {
    _playingMusic = audioModel;
}


+ (AudioModel *)previousMusic {
    NSInteger index = [_musics indexOfObject:_playingMusic];
    index--;
    if (0 > index) {
        index = _musics.count - 1;
    }
    return _musics[index];
}

+ (AudioModel *)nextMusic {
    NSInteger index = [_musics indexOfObject:_playingMusic];
    index++;
    if (index >= _musics.count) {
        index = 0;
    }
    return _musics[index];
}

//
+ (AVAudioPlayer *)playMusicWithFileName:(NSString *)fileName {
    // 1.创建空的播放器
    AVAudioPlayer *player = nil;
    
    [_players removeAllObjects];
    // 2.从字典中取出播放器
    player = _players[fileName];
    
    // 3.判断播放器是否为空
    if (player == nil) {
        // 4.生成对应音乐资源
        NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        if (fileUrl == nil) return nil;
        
        // 5.创建对应的播放器
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
        
        // 6.保存到字典中
        [_players setObject:player forKey:fileName];
        
        // 7.准备播放
        [player prepareToPlay];
    }
    
    // 8.开始播放
//    [player play];
    
    return player;
}

+ (AVAudioPlayer *)pauseMusicWithFileName:(NSString *)fileName {
    // 1.从字典中取出播放器
    AVAudioPlayer *player = _players[fileName];
    
    // 2.暂停音乐
    if (player) {
        [player pause];
    }
    
    return player;
}

+ (void)stopMusicWithFileName:(NSString *)fileName {
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
