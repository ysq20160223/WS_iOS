//
//  MyNewFeatureViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyNewFeatureViewController.h"

#import "MyNewFeatureViewCell.h"

#import "UIView+Frame.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

@interface MyNewFeatureViewController ()

@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *football;
@property (nonatomic, weak) UIImageView *line;
@property (nonatomic, weak) UIImageView *largeText;
@property (nonatomic, weak) UIImageView *smallText;

@end

@implementation MyNewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

static NSString *ID = @"CollectionViewCell";

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size; // 设置 cell 尺寸
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
    UIImageView *football = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    football.center = CGPointMake(screenW * .5, screenH * .5);
    [self.collectionView addSubview:football];
    _football = football;
    
    // 线
    UIImageView *line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    line.x -= 139;
    line.y += 10;
    [self.collectionView addSubview:line];
    _line = line;
    
    // 大文字
    UIImageView *largeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeText.center = CGPointMake(screenW * .5, screenH * .75);
    [self.collectionView addSubview:largeText];
    _largeText = largeText;
    
    // 小文字
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallText.center = CGPointMake(screenW * .5, screenH * .85);
    [self.collectionView addSubview:smallText];
    _smallText = smallText;
}

//
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"%s", __func__);
    
    // 获取当前偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    CGFloat delta = offsetX - _lastOffsetX;
    
    _lastOffsetX = offsetX; // 记录上一次
    
    _largeText.x += 2 * delta;
    _smallText.x += 2 * delta;
    
    [UIView animateWithDuration:.2 animations:^{
        _largeText.x -= delta;
        _smallText.x -= delta;
    }];
    
}

//
- (void)setUpCollectionView {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 注册 cell
    [self.collectionView registerClass:[MyNewFeatureViewCell class] forCellWithReuseIdentifier:ID];
    
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
    
    MyNewFeatureViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
//    NSLog(@"cell = %@", cell);
    
//    cell.backgroundColor = [UIColor cyanColor];
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground", indexPath.row + 1];
    cell.image = [UIImage imageNamed:imageName];
    
    // 最后一个 cell
    [cell setIndexPath:indexPath count:4];
    
    return cell;
    
}

@end



