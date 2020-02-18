//
//  ViewController.m
//  ios_091313
//
//  Created by Apple on 2017/8/6.
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
    
    // 1, 加载图片
    UIImage *image = [UIImage imageNamed:@"doubi.jpg"];
    
    // 2, 生成一个跟图片相同大小的图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 3, 在上下文添加一个图形裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    // 把路径设置成裁剪区域
    [path addClip];
    
    // 4, 把图片绘制在图片上下文
    [image drawAtPoint:CGPointZero];
    
    // 5, 生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6, 关闭图片上下文
    UIGraphicsEndImageContext();
    
    self.imageView.image = newImage;
    
}

@end


