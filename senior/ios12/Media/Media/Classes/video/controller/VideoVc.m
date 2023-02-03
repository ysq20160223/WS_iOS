//
//  VideoVc.m
//  Media
//
//  Created by Apple on 2022/9/4.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "VideoVc.h"

#import "VideoTool.h"
#import "UIView+X.h"

#import <SJVideoPlayer.h>

@interface VideoVc ()

@property (weak, nonatomic) IBOutlet UIView *vPlayerContainer;
@property (nonatomic, strong) SJVideoPlayer *player;
@end



@implementation VideoVc

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.player vc_viewDidAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player vc_viewWillDisappear];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player vc_viewDidDisappear];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = VideoTool.playingVideo.name;
    
//    UIButton *btnTitle = (UIButton *) self.navigationItem.titleView;
//    [btnTitle setTitle:VideoTool.playingVideo.name forState:UIControlStateNormal];
    
//    UILabel *lblTitle = [UILabel.alloc initWithFrame:CGRectMake(0, 0, 100, 44)];
//    lblTitle.text = VideoTool.playingVideo.name;
//    lblTitle.textColor = XColor(0xaa, 0xaa, 0xaa);
//    self.navigationItem.titleView = lblTitle;
    
    [self initPlayer];
    
}

- (void)initPlayer {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSLog(@"Player init start");
    self.player = SJVideoPlayer.player;
    NSLog(@"Player init end");
    self.player.defaultEdgeControlLayer.fixesBackItem = NO;
    self.player.defaultEdgeControlLayer.hiddenBackButtonWhenOrientationIsPortrait = YES;
    self.player.pausedToKeepAppearState = YES;
    self.player.controlLayerAppearManager.interval = 5; // 设置控制层隐藏间隔
    self.player.resumePlaybackWhenAppDidEnterForeground = YES;
    self.player.autoplayWhenSetNewAsset = YES;
    
    SJVideoPlayerURLAsset *asset = [SJVideoPlayerURLAsset.alloc initWithURL:[NSURL URLWithString:VideoTool.playingVideo.filename]];
    asset.startPosition = 1;
    NSLog(@"set player URLAsset");
    self.player.URLAsset = asset;

//    [self.view addSubview:self.player.view];
    [self.vPlayerContainer addSubview:self.player.view];
    
    
    self.player.view.frame = self.view.bounds;
    [self.player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0); /// 显示 ContainerView 红色背景颜色
    }];
    
    __weak typeof(self) _self = self;
    _player.rotationObserver.onRotatingChanged = ^(id<SJRotationManager>  _Nonnull mgr, BOOL isRotating) {
        __strong typeof(_self) self = _self;
        if ( !self ) return ;
        XLog
    };
    
}


- (void)dealloc {
    [self.player stop];
}


@end


