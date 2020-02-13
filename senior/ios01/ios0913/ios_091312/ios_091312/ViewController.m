//
//  ViewController.m
//  ios_091312
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
    
    UIImage *image = [UIImage imageNamed:@"abx.png"];
    
    // 生成图片
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawAtPoint:CGPointZero]; // 绘制图片
    
    // 绘制文字
    NSString *str = @"yy";
    [str drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:30]}];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    //
    self.imageView.image = newImage;
}

@end


