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
@end



@implementation VideoVc

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


- (void)dealloc {
    [self.player stop];
}


@end


