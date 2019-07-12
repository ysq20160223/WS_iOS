//
//  ViewController.m
//  ios_030104
//
//  Created by Apple on 2017/7/23.
//  Copyright © 2017年 Apple. All rights reserved.
//


#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate>
{
    UIImageView *_imageView;
}

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scrollView];
    
    UIImage *image = [UIImage imageNamed:@"yy_002.jpg"];
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yy_002.jpg"]];
    [scrollView addSubview:_imageView];
    
    scrollView.contentSize = image.size;
    
    // 设置代理
    scrollView.delegate = self;
    
    scrollView.maximumZoomScale = 2;
    scrollView.minimumZoomScale = 0.2;
}


// 这个方法返回的控件就能进行伸缩操作
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

@end






