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
    
    CGFloat screenW = self.view.frame.size.width;
    CGFloat screenH = self.view.frame.size.height;
    
    self.scrollView.frame = self.view.bounds;
    self.scrollView.backgroundColor = UIColor.lightGrayColor;
    
    for (int i = 0; i < kCount; i++) {
        UIImageView *iv = UIImageView.alloc.init;
        iv.frame = CGRectMake(i * screenW, 0, screenW, screenH); // 1, 设置 frame
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg", i + 1]]; // 2, 设置图片
        [self.scrollView addSubview:iv];
    }
    
    self.scrollView.contentSize = CGSizeMake(kCount * screenW, 0); // 总的内容
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES; // 分页
    self.scrollView.delegate = self; // 代理
    
    
    // 添加 PageControl
    self.pageControl = UIPageControl.alloc.init;
    self.pageControl.backgroundColor = [UIColor colorWithRed:1 green:0.6 blue:0 alpha:0.3];
    self.pageControl.center = CGPointMake(screenW * 0.5, screenH - 100);
    self.pageControl.bounds = CGRectMake(0, 0, 300, 100);
    self.pageControl.numberOfPages = kCount;
    self.pageControl.pageIndicatorTintColor = UIColor.lightGrayColor;
    self.pageControl.currentPageIndicatorTintColor = UIColor.magentaColor;
    self.pageControl.enabled = NO; // 默认为 YES
    
    [self.view addSubview:self.pageControl];
}


#pragma mark - UICollectionViewDelegate start
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@", scrollView);
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}
#pragma mark UICollectionViewDelegate end

@end


