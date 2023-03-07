//
//  XNewFeatureVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XNewFeatureVc.h"

#import "XNewFeatureViewCell.h"

#import "UIView+X.h"

@interface XNewFeatureVc ()

@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *footballIv;
@property (nonatomic, weak) UIImageView *lineIv;
@property (nonatomic, weak) UIImageView *largeTextIv;
@property (nonatomic, weak) UIImageView *smallTextIv;

@end



@implementation XNewFeatureVc

static NSString *ID = @"CollectionViewCell";

- (instancetype)init {
    UICollectionViewFlowLayout *layout = UICollectionViewFlowLayout.alloc.init;
    layout.itemSize = UIScreen.mainScreen.bounds.size; // 设置 cell 尺寸
    layout.minimumLineSpacing = 0; // 最小行间距
    layout.minimumInteritemSpacing = 0; // 设置每个 cell 之间间距
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0); // 设置每一组的间距
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpCollectionView];
    
    [self setUpAllChildView];
}

- (void)setUpAllChildView {
    // 足球
    UIImageView *football = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guide1"]];
    football.center = CGPointMake(kScreenW * .5, kScreenH * .4);
    [self.collectionView addSubview:football];
    //    football.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0 alpha:0.3];
    _footballIv = football;
    
    // 线
    UIImageView *line = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guideLine"]];
    line.xX -= 139;
    line.xY += 10;
    [self.collectionView addSubview:line];
    //    line.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:0.3];
    _lineIv = line;
    
    // 大文字
    UIImageView *largeText = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeText.center = CGPointMake(kScreenW * .5, kScreenH * .75);
    [self.collectionView addSubview:largeText];
    _largeTextIv = largeText;
    
    // 小文字
    UIImageView *smallText = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallText.center = CGPointMake(kScreenW * .5, kScreenH * .85);
    [self.collectionView addSubview:smallText];
    _smallTextIv = smallText;
}

// 滚动完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 获取当前偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger index = offsetX / kScreenW + 1;
    //    NSLog(@"offsetX: %f, index: %ld", offsetX, index);
    _footballIv.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ld", index]];
//    _footballIv.center = CGPointMake(kScreenW * (index - 1 + .5), kScreenH * .4);
    
    _largeTextIv.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%ld", index]];
    _smallTextIv.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%ld", index]];
    
    CGFloat delta = offsetX - _lastOffsetX;
    
    _lastOffsetX = offsetX; // 记录上一次
    
    _footballIv.xX += 2 * delta;
    _largeTextIv.xX += 2 * delta;
    _smallTextIv.xX += 2 * delta;
    
    [UIView animateWithDuration:.2 animations:^{
        _footballIv.xX -= delta;
        _largeTextIv.xX -= delta;
        _smallTextIv.xX -= delta;
    }];
}

//
- (void)setUpCollectionView {
    self.collectionView.backgroundColor = UIColor.whiteColor;
    // 注册 cell
    [self.collectionView registerClass:XNewFeatureViewCell.class forCellWithReuseIdentifier:ID];
    
    self.collectionView.pagingEnabled = YES; // 开启分页
    self.collectionView.showsHorizontalScrollIndicator = NO; // 隐藏滚动条
    self.collectionView.bounces = NO; // 取消弹簧效果
}

//
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XNewFeatureViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    //    NSLog(@"row: %ld, cell: %@", indexPath.row, cell);
    
//    cell.backgroundColor = XRandomColor();
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground", indexPath.row + 1];
    NSLog(@"%@; %@", imageName, indexPath);
    cell.image = [UIImage imageNamed:imageName];
    
    
    // 最后一个 cell
    [cell setIndexPath:indexPath count:4];
    
    return cell;
}

@end


