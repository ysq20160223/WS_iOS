//
//  AudioVc.m
//  Media
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#import "AudioVc.h"

// 第三方
#import "Masonry.h"

// category
#import "UIView+X.h"
#import "NSString+X.h"
#import "CALayer+X.h"

//
#import "MusicTool.h"
#import "AudioModel.h"
#import "LrcScrollView.h"
#import "LrcLabel.h"


@interface AudioVc () <UIScrollViewDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ivAlbum;

@property (weak, nonatomic) IBOutlet UILabel *lblSongName;
@property (weak, nonatomic) IBOutlet UILabel *lblSinger;
@property (weak, nonatomic) IBOutlet UIButton *btnCenterIcon;

@property (weak, nonatomic) IBOutlet UISlider *slideAudio;
@property (weak, nonatomic) IBOutlet LrcLabel *lblLrc;

//
@property (weak, nonatomic) IBOutlet UILabel *lblCurTime;
@property (weak, nonatomic) IBOutlet UILabel *lblDurationTime;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayOrPause;

@property (weak, nonatomic) IBOutlet LrcScrollView *svLrc;

// **
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *progressTimer;
@property (strong, nonatomic) CADisplayLink *lrcCADisplayLink;

@property (strong, nonatomic) CABasicAnimation *rotationAnim;

@end



@implementation AudioVc

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setupCenterIconRadius];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //    XLog
    // 添加毛玻璃
    [self setupBlur];
    
    // 进度条颜色
    [self.slideAudio setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];
    
    // 播放歌曲
    [self startPlayMusic];
    
    // 设置歌词 ScrollView
    self.svLrc.contentSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
    
    // 接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sceneDidBecomeActive) name:@"sceneDidBecomeActive" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sceneDidEnterBackground) name:@"sceneDidEnterBackground" object:nil];
}

- (void)startPlayMusic {
    //    NSLog(@"%@", [MusicTool musics]);
    
    // 1
    AudioModel *audioModel = [MusicTool playingMusic];
    NSLog(@"%@", audioModel);
    
    // 2
    self.lblSongName.text = audioModel.name;
    self.lblSinger.text = audioModel.singer;
    
    
    self.ivAlbum.image = [UIImage imageNamed:audioModel.icon];
    [self.btnCenterIcon setImage:[UIImage imageNamed:audioModel.icon] forState:UIControlStateNormal];
    [self.btnCenterIcon setImage:[UIImage imageNamed:audioModel.icon] forState:UIControlStateHighlighted];
    self.svLrc.lrcName = [MusicTool playingMusic].lrcname;
    self.svLrc.lrcLabel = self.lblLrc;
    
    // 3
    self.audioPlayer = [MusicTool playMusicWithFileName:audioModel.filename];
    self.audioPlayer.delegate = self;
    [self updateProgressInfo];
    [self addCenterIconRotate];
    [self playAudio];
    
    // 4
    [self removeProgressTimer];
    [self setupProgressTimer];
    [self removeLrcCADisplayLink];
    [self addLrcCADisplayLink];
    
}


#pragma mark - 添加图片圆角
- (void)setupCenterIconRadius {
    //    NSLog(@"%@", NSStringFromCGRect(self.btnCenterIcon.bounds));
    self.btnCenterIcon.layer.cornerRadius = self.btnCenterIcon.bounds.size.width * 0.5;
    self.btnCenterIcon.layer.masksToBounds = YES;
    self.btnCenterIcon.layer.borderColor = XColorAlpha(36, 36, 36, 0.9).CGColor;
    self.btnCenterIcon.layer.borderWidth = 8;
}


#pragma mark - 添加毛玻璃
- (void)setupBlur {
    // 1
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.translucent = YES;
    [self.ivAlbum addSubview:toolBar];
    
    // 2
    toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    [toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.ivAlbum);
    }];
}


#pragma mark - UIScrollViewDelegate START
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 1, 偏移量
    CGPoint point = scrollView.contentOffset;
    
    // 2, 滑动比例
    CGFloat alpha = 1 - point.x / scrollView.bounds.size.width;
    
    // 3
    self.btnCenterIcon.alpha = alpha;
    self.lblLrc.alpha = alpha;
}
#pragma mark - UIScrollViewDelegate END


#pragma mark - click Listener START
- (IBAction)clickBtnMinPlayer:(UIButton *)sender {
    XLog
}

- (IBAction)clickBtnMore:(UIButton *)sender {
    XLog
}

// slide start
- (IBAction)audioSlideProgress:(UISlider *)sender {
    //    NSLog(@"value: %.2f", sender.value)
}

- (IBAction)audioSlideTapGestureRecognizer:(UITapGestureRecognizer *)sender {
    // 1
    CGPoint clickPoint = [sender locationInView:sender.view];
    
    // 2
    CGFloat ratio = clickPoint.x / self.slideAudio.bounds.size.width;
    
    // 3
    self.audioPlayer.currentTime = self.audioPlayer.duration * ratio;
    
    // 4
    [self updateProgressInfo];
}

- (IBAction)audioSlideTouchDown:(UISlider *)sender {
    [self pauseAudio];
    [self removeProgressTimer];
}

- (IBAction)audioSlideTouchUpInside:(UISlider *)sender {
    self.audioPlayer.currentTime = self.slideAudio.value * self.audioPlayer.duration;
    [self playAudio];
    
    [self setupProgressTimer];
}
// slide end

- (IBAction)clickBtnPrevious:(UIButton *)sender {
    //    XLog
    [self.btnCenterIcon.layer pauseAnimate];
    [self playMusic:[MusicTool previousMusic]];
}

- (IBAction)clickBtnPlayPause:(UIButton *)sender {
//    XLog
    if (self.audioPlayer.isPlaying) {
        [self pauseAudio];
    } else {
        [self playAudio];
    }
}

- (IBAction)clickBtnNext:(UIButton *)sender {
    //    XLog
    [self.btnCenterIcon.layer pauseAnimate];
    [self playMusic:[MusicTool nextMusic]];
}

- (void)playMusic:(AudioModel *)audioModel {
    // 1
    AudioModel *playingAudioModel = [MusicTool playingMusic];
    [MusicTool pauseMusicWithFileName:playingAudioModel.filename];
    
    // 2
    [MusicTool setupPlayingMusicModel:audioModel];
    
    // 3
    [self startPlayMusic];
}


#pragma mark - play controller
- (void)playAudio {
    [self.audioPlayer play];
    [self.btnPlayOrPause setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
    [self.btnPlayOrPause setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateHighlighted];
    
//    [self.btnCenterIcon.imageView setContentMode:UIViewContentModeCenter];
    
//    XLog
    [self.btnCenterIcon.layer resumeAnimate];
    
    [self setupLockInfo];
}

- (void)pauseAudio {
    [self.audioPlayer pause];
    [self.btnPlayOrPause setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
    [self.btnPlayOrPause setImage:[UIImage imageNamed:@"player_btn_play_highlight"] forState:UIControlStateHighlighted];
    
//    XLog
    [self.btnCenterIcon.layer pauseAnimate];
}


#pragma mark - 添加旋转动画
- (void)addCenterIconRotate {
//    XLog
    [self.btnCenterIcon.layer addAnimation:self.rotationAnim forKey:nil];
}


#pragma mark - 更新播放时间
- (void)updateProgressInfo {
    //
    self.lblCurTime.text = [NSString formatMediaTime:self.audioPlayer.currentTime];
    self.lblDurationTime.text = [NSString formatMediaTime:self.audioPlayer.duration];
    
    //
    self.slideAudio.value = self.audioPlayer.currentTime / self.audioPlayer.duration;
}


#pragma mark - 播放定时器
- (void)setupProgressTimer {
    [self updateProgressInfo];
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgressInfo) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.progressTimer forMode:NSRunLoopCommonModes];
}


#pragma mark - 移除播放定时器
- (void)removeProgressTimer {
    [self.progressTimer invalidate];
    self.progressTimer = nil;
}


#pragma mark - update LRC
- (void)updateLrcInfo {
    self.svLrc.lrcCurTime = self.audioPlayer.currentTime;
}


#pragma mark - 歌词定时器
- (void)addLrcCADisplayLink {
    self.lrcCADisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateLrcInfo)];
    [self.lrcCADisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}


#pragma mark - 移除歌词定时器
- (void)removeLrcCADisplayLink {
    [self.lrcCADisplayLink invalidate];
    self.lrcCADisplayLink = nil;
}


#pragma mark - 设置锁屏信息
- (void)setupLockInfo {
    // 0, 获取当前播放音乐
    AudioModel *audioModel = [MusicTool playingMusic];
    
    // 1, 获取锁屏中心
    MPNowPlayingInfoCenter *playingInfoCenter = [MPNowPlayingInfoCenter defaultCenter];
    
    // 2, 设置锁屏参数
    NSMutableDictionary *playingDict = [NSMutableDictionary dictionary];
    [playingDict setObject:audioModel.name forKey:MPMediaItemPropertyAlbumTitle];
    [playingDict setObject:audioModel.singer forKey:MPMediaItemPropertyArtist];
    [playingDict setObject:@(self.audioPlayer.duration) forKey:MPMediaItemPropertyPlaybackDuration];
    [playingDict setObject:@(self.audioPlayer.currentTime) forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    
    //    [playingDict setObject:[[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:audioModel.icon]] forKey:MPMediaItemPropertyArtwork];
    [playingDict setObject:[[MPMediaItemArtwork alloc] initWithBoundsSize:CGSizeMake(200, 200) requestHandler:^UIImage * _Nonnull(CGSize size) {
        return [UIImage imageNamed:audioModel.icon];
    }] forKey:MPMediaItemPropertyArtwork];
    
    playingInfoCenter.nowPlayingInfo = playingDict;
    
    // 3, 开启远程交互
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    NSLog(@"event: %@", event); 
    switch (event.subtype) {
        case UIEventSubtypeRemoteControlPlay:
        case UIEventSubtypeRemoteControlPause:
            [self clickBtnPlayPause:nil];
            break;
            
        case UIEventSubtypeRemoteControlNextTrack:
            [self clickBtnNext:nil];
            break;
            
        case UIEventSubtypeRemoteControlPreviousTrack:
            [self clickBtnPrevious:nil];
            break;
            
        default:
            break;
    }
}


#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"flag: %d", flag);
    if (flag) {
        [self clickBtnNext:nil];
    }
}


#pragma mark - Lifecycle
- (void)sceneDidEnterBackground {
    [self setupLockInfo];
}

- (void)sceneDidBecomeActive {
    
}


#pragma mark - Lazy load
- (CABasicAnimation *)rotationAnim {
    if (!_rotationAnim) {
        CABasicAnimation *rotateAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotateAnim.fromValue = @(0);
        rotateAnim.toValue = @(M_PI * 2);
        rotateAnim.repeatCount = NSUIntegerMax;
        rotateAnim.duration = 35;
        rotateAnim.removedOnCompletion = NO;
        _rotationAnim = rotateAnim;
    }
    return _rotationAnim;
}

#pragma mark -
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end


