//
//  ViewController.m
//  ios_030104
//
//  Created by Apple on 2017/7/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate>

@property (strong, nonatomic) UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = UIScrollView.alloc.init;
    [self.view addSubview:scrollView];
    
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = UIColor.lightGrayColor;
    scrollView.delegate = self; // 设置代理
    
    scrollView.maximumZoomScale = 2;
    scrollView.minimumZoomScale = 0.2;
    
    self.imageView = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"yy_002.jpg"]];
    [scrollView addSubview:self.imageView];
    scrollView.contentSize = self.imageView.image.size;
}


#pragma mark - UICollectionViewDelegate start
// 这个方法返回的控件就能进行伸缩操作
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"%@", scrollView);
    return self.imageView;
}
#pragma mark - UICollectionViewDelegate end


@end


