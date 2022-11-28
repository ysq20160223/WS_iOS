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
#import "AudioGridCVCell.h"
#import "UIView+X.h"
#import "AudioModel.h"
#import "Config.h"
#import "AudioListHeaderRv.h"

#import <Masonry.h>


@interface AudioListVc () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) ModeView modeView;

@end



@implementation AudioListVc


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)onClickRightBarButton {
    if (self.modeView == ModeViewList) {
        self.modeView = ModeViewGrid;
    } else {
        self.modeView = ModeViewList;
    }
    [self.collectionView reloadData];
}

- (void)initRightBarButtonItem {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(onClickRightBarButton) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"main_tab_more_n"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:btn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Audio";
    
//    self.view.backgroundColor = XColor(0x33, 0x33, 0x33);
    
//    [self.collectionView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    
    self.modeView = ModeViewList;
    
    [self initCollectionView];
    
    [self initRightBarButtonItem];

}


#pragma mark -
- (void)initCollectionView {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout.alloc init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    layout.sectionHeadersPinToVisibleBounds = NO;
    
    self.collectionView.collectionViewLayout = layout;
    
    self.collectionView.backgroundColor = XColor(0x3a, 0x3b, 0x3c);
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.left.mas_equalTo(self.view.mas_left);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
    }];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(AudioListCVCell.class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(AudioListCVCell.class)];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(AudioGridCVCell.class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(AudioGridCVCell.class)];
    
    //
    [self.collectionView registerClass:[AudioListHeaderRv class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(AudioListHeaderRv.class)];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return AudioTool.audioArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.modeView == ModeViewList) {
        return CGSizeMake(self.view.xWidth - 10 - 10, 64);
    } else {
        int i = (self.view.xWidth - 10 - 10) * 0.5 - 10 * 0.5;
        return CGSizeMake(i, i);
    }
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
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark - UICollectionViewDataSource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AudioModel *audioModel = AudioTool.audioArray[indexPath.row];
    
    if (self.modeView == ModeViewList) {
        AudioListCVCell *audioListCVCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(AudioListCVCell.class) forIndexPath:indexPath];
        [audioListCVCell setAudioModel:audioModel withIndexPath:indexPath];
        return audioListCVCell;
    } else {
        AudioGridCVCell *audioGridCVCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(AudioGridCVCell.class) forIndexPath:indexPath];
        [audioGridCVCell setAudioModel:audioModel withIndexPath:indexPath];
        return audioGridCVCell;
    }
}


#pragma mark -
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if(kind == UICollectionElementKindSectionHeader) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(AudioListHeaderRv.class) forIndexPath:indexPath];
    }
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    XLog
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.width);
}

@end


