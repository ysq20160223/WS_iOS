//
//  ViewController.m
//  ios_030101
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIScrollView *_scrollView;
    UIImageView *_imageView;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    _scrollView = scrollView;
    
    scrollView.frame = CGRectMake(0, kStatusBarH, self.view.frame.size.width, 500); // 设置 ScrollView 的可见范围
    scrollView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:scrollView];
    
    // --
    // 通过这种方法创建的 UIImageView 无需指定 frame
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"t_005.jpg"]];
    
    //
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"t_005.jpg"];
    imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
    
    
    [scrollView addSubview:imageView];
    _imageView = imageView;
    
    scrollView.contentSize = imageView.frame.size; // 设置 UIScrollView 的滚动范围
    
    // 0102
//    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.bounces = NO; //
    scrollView.contentInset = UIEdgeInsetsMake(10, 30, 50, 70); // top, left, bottom, right
    
}

- (IBAction)move:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        // 0103
        CGPoint point = _scrollView.contentOffset;
        switch (sender.tag) {
            case 1: // left
                point.x -= 150;
                break;
                
            case 2: // top
                point.y -= 150;
                break;
                
            case 3: // right
                point.x += 150;
                break;
                
            case 4: // bottom
                point.y += 150;
                break;
                
            case 5:
                //
//                point.x = 0;
//                point.y = 0;
                
                point = CGPointZero;
                break;
        }
        _scrollView.contentOffset = point;
    }];
}

@end


