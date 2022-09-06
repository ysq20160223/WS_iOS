//
//  AudioListVc.m
//  Media
//
//  Created by Apple on 2022/9/3.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "AudioListVc.h"
#import "AudioVc.h"
#import "AudioTool.h"
#import "AudioListCVCell.h"
#import "UIView+X.h"
#import "AudioModel.h"
#import "Config.h"

#import <Masonry.h>

#define kAudioListCVCell @"AudioListCVCell"

@interface AudioListVc () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end



@implementation AudioListVc


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Audio";
    
//    self.view.backgroundColor = XColor(0x33, 0x33, 0x33);
    self.collectionView.backgroundColor = XColor(0x33, 0x33, 0x33);
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(AudioListCVCell.class) bundle:nil] forCellWithReuseIdentifier:kAudioListCVCell];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return AudioTool.audioArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.xWidth - 0, 64);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [AudioTool setupPlayingAudioModel:AudioTool.audioArray[indexPath.row]];
    
    // fun 01
//    [self.navigationController pushViewController:AudioVc.alloc.init animated:YES];
    
    // fun 02
    AudioVc *audioVc = AudioVc.alloc.init;
//    audioVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:audioVc animated:YES completion:nil];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 0, 10, 0);
}

#pragma mark - UICollectionViewDataSource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AudioListCVCell *audioListCVCell = [collectionView dequeueReusableCellWithReuseIdentifier:kAudioListCVCell forIndexPath:indexPath];
    AudioModel *audioModel = AudioTool.audioArray[indexPath.row];
    [audioListCVCell setAudioModel:audioModel withIndexPath:indexPath];
    return audioListCVCell;
}


@end


