//
//  ViewController.m
//  ios_030108
//
//  Created by Apple on 2017/7/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "../../../../PreHeader.h"

#define kCount 8

@interface ViewController () <UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat screenW = self.view.frame.size.width;
    CGFloat screenH = self.view.frame.size.height;
    
    _scrollView.frame = CGRectMake(0, 0, screenW, screenH);
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    
    for (int i = 0; i < kCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        // 1, 设置 frame
        imageView.frame = CGRectMake(i * screenW, 0, screenW, screenH);
        
        // 2, 设置图片
        NSString *imagName = [NSString stringWithFormat:@"0%d.jpg", i + 1];
        imageView.image = [UIImage imageNamed:imagName];
        
        [_scrollView addSubview:imageView];
    }
    
    _scrollView.contentSize = CGSizeMake(kCount * screenW, 0); // 总的内容
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.pagingEnabled = YES; // 分页
    _scrollView.delegate = self; // 代理
    
    // 添加 PageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(screenW * 0.5, screenH - 50);
    pageControl.bounds = CGRectMake(0, 0, 150, 150);
    
    pageControl.numberOfPages = kCount;
    
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
    pageControl.enabled = NO; // 默认为 YES
    
    _pageControl = pageControl;
    
    [self.view addSubview:pageControl];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll");
    
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    _pageControl.currentPage = page;
    
}

@end




