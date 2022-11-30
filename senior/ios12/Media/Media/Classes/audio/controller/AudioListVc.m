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
#import "UIDevice+X.h"
#import "UIImage+X.h"

#import <Masonry.h>


@interface AudioListVc () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSInteger _navigationBarH;
    
    NSInteger _headViewH;
    NSInteger _headViewMinH;
}

@property (nonatomic, assign) ModeView modeView;

@end



@implementation AudioListVc


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollView: %@", scrollView);
    
    // 偏移量: 内容与可视范围的差值; 内容起始点的偏移量为0
    CGFloat curOffsetY = scrollView.contentOffset.y;
    
    
    // 设置透明度
    CGFloat alpha = curOffsetY / (_headViewH - _headViewMinH);
    if (alpha >= 1) {
        alpha = 0.99;
    }
    NSLog(@"curOffsetY: %.2f; alpha: %.2f", curOffsetY, alpha);
    
    UIImage *image = [UIImage imageWithColor:XColorAlpha(0x33, 0x33, 0x33, alpha)];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault]; // 设置导航条背景图片
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)onClickRightBarButton {
    if (self.modeView == ModeViewList) {
        self.modeView = ModeViewGrid;
    } else {
        self.modeView = ModeViewList;
    }
    [self.collectionView reloadData];
}

#pragma mark -
- (void)initCollectionView {
    UICollectionViewFlowLayout *layout = UICollectionViewFlowLayout.alloc.init;
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
    [self.collectionView registerClass:AudioListHeaderRv.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(AudioListHeaderRv.class)];
    
    self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    NSLog(@"safeDistanceBottom: %f; tabBarFullHeight: %f; isNavigationBarHidden: %d", UIDevice.safeDistanceBottom, UIDevice.tabBarFullHeight, self.navigationController.isNavigationBarHidden);
    // UIScrollViewContentInsetAdjustmentNever == self.collectionView.contentInsetAdjustmentBehavior
    // YES == self.navigationController.isNavigationBarHidden
    if(UIScrollViewContentInsetAdjustmentNever == self.collectionView.contentInsetAdjustmentBehavior) {
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, UIDevice.tabBarFullHeight, 0);
    }
}

- (void)initRightBarButtonItem {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(onClickRightBarButton) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"main_tab_more_n"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:btn];
}

- (void)setUpNavigation {
    // UIBarMetricsDefault : 只有设置这种样式, 才能设置导航条背景图片
    self.navigationController.navigationBar.shadowImage = UIImage.alloc.init; // 清空导航条的阴影的线
    
    UIImage *image = [UIImage imageWithColor:XColorAlpha(0x33, 0x33, 0x33, 0)];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault]; // 设置导航条背景图片
    
//    // 标题透明
//    UILabel *label = UILabel.alloc.init;
//    label.text = @"YY";
//    [label sizeToFit]; // 尺寸自适应
//    label.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
//    [self.navigationItem setTitleView:label];
    
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.title = @"Audio";
//    self.view.backgroundColor = XColor(0x33, 0x33, 0x33);
    
    _navigationBarH = self.navigationController.navigationBar.frame.size.height;
    _headViewH = 300;
    _headViewMinH = _navigationBarH + kStatusBarH;
    
    self.modeView = ModeViewList;
    
    [self initCollectionView];
    
    [self initRightBarButtonItem];

    [self setUpNavigation];
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
    return CGSizeMake(self.view.frame.size.width, 300);
}

@end


