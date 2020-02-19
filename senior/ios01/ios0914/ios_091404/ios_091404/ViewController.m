//
//  ViewController.m
//  091404
//
//  Created by Apple on 2017/8/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView.userInteractionEnabled = YES;
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获取当前手指所在的点
    CGPoint curP = [pan locationInView:self.imageView];
    CGFloat rectWH = 35;
    CGFloat x = curP.x - rectWH * .5;
    CGFloat y = curP.y - rectWH * .5;
    
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
    
    //
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 把 UIImageView 上面的图片给绘制到上下文
    [self.imageView.layer renderInContext:ctx];
    
    // 确定擦除区域
    CGContextClearRect(ctx, rect);
    
    // 生成一张新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 把上下文关闭
    UIGraphicsEndImageContext();
    
    self.imageView.image = newImage;
    
}

@end


