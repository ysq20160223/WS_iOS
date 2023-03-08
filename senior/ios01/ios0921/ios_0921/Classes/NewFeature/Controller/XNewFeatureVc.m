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

@property (nonatomic, strong) UIImageView *ivFootball;
@property (nonatomic, strong) UIImageView *ivLine;
@property (nonatomic, strong) UIImageView *ivLargeText;
@property (nonatomic, strong) UIImageView *ivSmallText;

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
    _ivFootball = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guide1"]];
    _ivFootball.center = CGPointMake(kScreenW * .5, kScreenH * .4);
    _ivFootball.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:.5];
    [self.collectionView addSubview:_ivFootball];
    
    // 线
    _ivLine = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guideLine"]];
    _ivLine.xX -= 139;
    _ivLine.xY += 10;
    _ivLine.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:.5];
    [self.collectionView addSubview:_ivLine];
    
    // 大文字
    _ivLargeText = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    _ivLargeText.center = CGPointMake(kScreenW * .5, kScreenH * .75);
    _ivLargeText.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:.5];
    [self.collectionView addSubview:_ivLargeText];
    
    // 小文字
    _ivSmallText = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    _ivSmallText.center = CGPointMake(kScreenW * .5, kScreenH * .85);
    _ivSmallText.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:.5];
    [self.collectionView addSubview:_ivSmallText];
}

// 滚动完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 获取当前偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger index = offsetX / kScreenW + 1;
    //    NSLog(@"offsetX: %f, index: %ld", offsetX, index);
    _ivFootball.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ld", index]];
//    _ivFootball.center = CGPointMake(kScreenW * (index - 1 + .5), kScreenH * .4);
    
    _ivLargeText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%ld", index]];
    _ivSmallText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%ld", index]];
    
    CGFloat delta = offsetX - _lastOffsetX;
    
    _lastOffsetX = offsetX; // 记录上一次
    
    _ivFootball.xX += 2 * delta;
    _ivLargeText.xX += 2 * delta;
    _ivSmallText.xX += 2 * delta;
    
    [UIView animateWithDuration:.2 animations:^{
        _ivFootball.xX -= delta;
        _ivLargeText.xX -= delta;
        _ivSmallText.xX -= delta;
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
    
//    cell.backgroundColor = XRandomColor();
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground", indexPath.row + 1];
    NSLog(@"%@; %@", imageName, indexPath);
    cell.image = [UIImage imageNamed:imageName];
    
    
    // 最后一个 cell
    [cell setIndexPath:indexPath count:4];
    
    return cell;
}

@end


