//
//  ViewController.m
//  ios_091402
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end




@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"");
    
    // 1, 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    // 获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // UIView 之所以能够显示, 是因为它内部有一个层, 层是通过渲染的方法, 给绘制上下文
    [self.view.layer renderInContext:ctx];
    
    // 生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // 如何把图片转换成二进制流
//    NSData *data = UIImageJPEGRepresentation(newImage, 1);
//    [data writeToFile:@"/Users/Apple/Desktop/newImage.jpg" atomically:YES];
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/Apple/Desktop/newImage.png" atomically:YES];
    
    // 关闭上下文
    UIGraphicsEndImageContext();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

@end


