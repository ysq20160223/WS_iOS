//
//  ViewController.m
//  ios_030101
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "UIView+X.h"

@interface ViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = UIScrollView.alloc.init;
    [self.view addSubview:self.scrollView];
    
    self.scrollView.frame = CGRectMake(0, kStatusBarH, self.view.xWidth, 400); // 设置 ScrollView 的可见范围
    self.scrollView.backgroundColor = UIColor.magentaColor;
    
    
    // --
    // 通过这种方法创建的 UIImageView 无需指定 frame
    self.imageView = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"t_005.jpg"]];
    
    //
//    self.imageView = [UIImageView.alloc init];
//    self.imageView.image = [UIImage imageNamed:@"t_005.jpg"];
//    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.frame.size; // 设置 UIScrollView 的滚动范围
    
    // 0102
//    self.scrollView.showsVerticalScrollIndicator = NO;
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//    self.scrollView.bounces = NO; //
    self.scrollView.contentInset = UIEdgeInsetsMake(10, 30, 50, 70); // top, left, bottom, right
    
}

- (IBAction)move:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        // 0103
        CGPoint point = self.scrollView.contentOffset;
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
        self.scrollView.contentOffset = point;
    }];
}

@end


