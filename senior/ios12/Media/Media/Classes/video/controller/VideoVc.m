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

@interface VideoVc ()
@property (nonatomic, strong) Player *player;
@property (nonatomic, strong) UIButton *btnBack;
@end



@implementation VideoVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initPlayer];
    
    self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.btnBack];
//    self.btnBack.backgroundColor = XRandomColor();
    [self.btnBack setImage:[UIImage imageNamed:@"miniplayer_btn_playlist_close_b"] forState:UIControlStateNormal];
    [self.btnBack setImage:[UIImage imageNamed:@"miniplayer_btn_playlist_close"] forState:UIControlStateHighlighted];
    [self.btnBack addTarget:self action:@selector(onClickBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.top.mas_equalTo(self.view.mas_top).offset(64);
        make.width.height.mas_equalTo(55);
    }];
}

- (void)initPlayer {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSLog(@"Player init start");
    self.player = [Player.alloc init];
    NSLog(@"Player init end");
    self.player.edgeLayer.showResidentBackButton = NO;
    self.player.edgeLayer.hiddenBackBtnWhenOrientationIsPortrait = YES;
    self.player.pausedToKeepAppearState = YES;
    self.player.layerAppearManagerProtocol.interval = 5; // 设置控制层隐藏间隔
    self.player.resumePlaybackWhenAppDidEnterForeground = YES;
    self.player.autoplayWhenSetNewAsset = YES;
    
    URLAsset *asset = [URLAsset.alloc initWithURL:[NSURL URLWithString:VideoTool.playingVideo.filename]];
    asset.startPosition = 1;
    NSLog(@"set player URLAsset");
    self.player.urlAsset = asset;

    [self.view addSubview:self.player.playerView];
    
    
    self.player.playerView.frame = self.view.bounds;
    [self.player.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.inset = 0; /// 显示 ContainerView 红色背景颜色
    }];

    
    __weak typeof(self) _weakSelf = self;
    self.player.rotationObserver.rotationDidStartExeBlock = ^(id<RotationManagerProtocol>  _Nonnull mgr) {
        __strong typeof(_weakSelf) self = _weakSelf;
        if ( self ) {
            NSLog(@"%@; currentOrientation: %ld", mgr, mgr.currentOrientation);
        }
    };
}
- (IBAction)onClickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [self.player stop];
}


@end


