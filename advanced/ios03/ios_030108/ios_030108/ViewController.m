//
//  ViewController.m
//  ios_030108
//
//  Created by Apple on 2017/7/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#define kCount 8

@interface ViewController () <UICollectionViewDelegate>

@property (strong, nonatomic) UIPageControl *pageControl;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat screenW = self.view.frame.size.width;
    CGFloat screenH = self.view.frame.size.height;
    
    _scrollView.frame = self.view.bounds;
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    
    for (int i = 0; i < kCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * screenW, 0, screenW, screenH); // 1, 设置 frame
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg", i + 1]]; // 2, 设置图片
        [_scrollView addSubview:imageView];
    }
    
    _scrollView.contentSize = CGSizeMake(kCount * screenW, 0); // 总的内容
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES; // 分页
    _scrollView.delegate = self; // 代理
    
    
    // 添加 PageControl
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.backgroundColor = [UIColor colorWithRed:1 green:0.6 blue:0 alpha:0.3];
    _pageControl.center = CGPointMake(screenW * 0.5, screenH - 100);
    _pageControl.bounds = CGRectMake(0, 0, 300, 100);
    _pageControl.numberOfPages = kCount;
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor magentaColor];
    _pageControl.enabled = NO; // 默认为 YES
    
    [self.view addSubview:_pageControl];
}


#pragma mark - UICollectionViewDelegate start
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@", scrollView);

    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
}
#pragma mark UICollectionViewDelegate end

@end


