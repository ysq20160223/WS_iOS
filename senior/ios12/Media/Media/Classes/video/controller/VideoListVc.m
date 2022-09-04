//
//  VideoListVc.m
//  Media
//
//  Created by Apple on 2022/9/4.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "VideoListVc.h"
#import "VideoVc.h"
#import "VideoTool.h"
#import "VideoListCVCell.h"
#import "UIView+X.h"
#import "VideoModel.h"

#import <Masonry.h>

#define kVideoListCVCell @"VideoListCVCell"

@interface VideoListVc () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end



@implementation VideoListVc

// 设置 NavigationBar 颜色
//- (void)viewWillAppear:(BOOL)animated {
//    if (@available(iOS 13.0, *)) {
//        UINavigationBarAppearance *appearance = UINavigationBarAppearance.alloc.init;
//        appearance.backgroundColor = XColor(0x33, 0x33, 0x33);
//        self.navigationController.navigationBar.standardAppearance = appearance;
//        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
//    }
//}

- (void)viewWillAppear:(BOOL)animated {
//    XLog
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.view.backgroundColor = XColor(0x33, 0x33, 0x33);
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout.alloc init];
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 0;
    layout.sectionHeadersPinToVisibleBounds = YES;
    
    self.collectionView = [UICollectionView.alloc initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = XColor(0x33, 0x33, 0x33);
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.layer.cornerRadius = 10;
    self.collectionView.layer.masksToBounds = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(VideoListCVCell.class) bundle:nil] forCellWithReuseIdentifier:kVideoListCVCell];
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return VideoTool.videoArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.xWidth - 0, 64);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [VideoTool setupPlayingVideoModel:VideoTool.videoArray[indexPath.row]];
    [self.navigationController pushViewController:VideoVc.alloc.init animated:YES];
}


#pragma mark - UICollectionViewDataSource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoListCVCell *videoListCVCell = [collectionView dequeueReusableCellWithReuseIdentifier:kVideoListCVCell forIndexPath:indexPath];
    VideoModel *videoModel = VideoTool.videoArray[indexPath.row];
    [videoListCVCell setVideoModel:videoModel withIndexPath:indexPath];
    return videoListCVCell;
}


@end


