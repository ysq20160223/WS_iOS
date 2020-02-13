//
//  ViewController.m
//  ios_091401
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+Border.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    self.imageView.image = [self imageWithBorderWidth:5 borderColor:[UIColor cyanColor] image:[UIImage imageNamed:@"aLi.png"]];
    
    self.imageView.image = [UIImage imageWithBorderWidth:5 borderColor:[UIColor magentaColor] image:[UIImage imageNamed:@"abx.png"]];
    
}

- (UIImage *)imageWithBorderWidth:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image  {
    // 1, 加载图片
//    UIImage *image = [UIImage imageNamed:@"aLi.png"];
    
    // 2, 边框宽度
//    CGFloat borderW = 10;
    
    // 3, 开启图片上下文
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 4, 先描述一个大圈, 设为填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
//    [[UIColor cyanColor] set]; // 设置边框的颜色
    [color set];
    
    [path fill];
    
    // 5, 再添加一个小圈, 把小圈设为裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    
    // 6, 把图片给绘制到上下文
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    // 7, 生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8, 关闭上下文
    UIGraphicsEndImageContext();
    
//    self.imageView.image = newImage;
    
    return newImage;
}


@end




