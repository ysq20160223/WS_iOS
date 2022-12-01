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
#import "Config.h"
#import "UIImage+X.h"

#import <Masonry.h>

#define kVideoListCVCell @"VideoListCVCell"

@interface VideoListVc () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end



@implementation VideoListVc

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)initCollectionView {
    UICollectionViewFlowLayout *layout = UICollectionViewFlowLayout.alloc.init;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    layout.sectionHeadersPinToVisibleBounds = YES;
    
    self.collectionView = [UICollectionView.alloc initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = XColor(0x3a, 0x3b, 0x3c);
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(VideoListCVCell.class) bundle:nil] forCellWithReuseIdentifier:kVideoListCVCell];
}

- (void)setUpNavigation {
    // UIBarMetricsDefault : 只有设置这种样式, 才能设置导航条背景图片
    self.navigationController.navigationBar.shadowImage = UIImage.alloc.init; // 清空导航条的阴影的线
    
    UIImage *image = [UIImage imageWithColor:XColorAlpha(0x33, 0x33, 0x33, 0)];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault]; // 设置导航条背景图片
    
//    // 标题透明
    UILabel *label = UILabel.alloc.init;
    label.text = @"Video";
    [label sizeToFit]; // 尺寸自适应
    label.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    [self.navigationItem setTitleView:label];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Video";
    
//    self.view.backgroundColor = XColor(0x33, 0x33, 0x33);
    
    [self initCollectionView];
    
    [self setUpNavigation];
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

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 0, 10, 0);
}


#pragma mark - UICollectionViewDataSource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoListCVCell *videoListCVCell = [collectionView dequeueReusableCellWithReuseIdentifier:kVideoListCVCell forIndexPath:indexPath];
    VideoModel *videoModel = VideoTool.videoArray[indexPath.row];
    [videoListCVCell setVideoModel:videoModel withIndexPath:indexPath];
    return videoListCVCell;
}


@end


