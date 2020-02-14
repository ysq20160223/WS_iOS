//
//  ViewController.m
//  ios_092807
//
//  Created by Apple on 2017/8/19.
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
}


- (IBAction)btnClick:(id)sender {
    
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@""];
    
}

- (void)run:(NSString *)str {
    // 下载图片
    // 1, url 
//    NSURL *url = [NSURL URLWithString:@"http://cache.qinsmoon.com/a/qinsmoon/downloads/wallpaper/2016-02-29/e06143824ed6bc953f6668aca4422a5a.jpg"];
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    
    // 2, 下载图片
//    NSDate *startDate = [NSDate date];
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
//    NSLog(@"time = %f", [[NSDate date] timeIntervalSinceDate:startDate]);
    
    NSLog(@"CFAbsoluteTime = %f", CFAbsoluteTimeGetCurrent() - start);
    
    // 3, 二进制转化为图片
    UIImage *image = [UIImage imageWithData:data];
    
    // 4, 在主线程中刷新 UI
    // 4.1
//    [self performSelectorOnMainThread:@selector(runOnMain:) withObject:image waitUntilDone:YES];
    
    // 4.2
//    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
    
    // 4.3
    [self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
    
}

//- (void)runOnMain:(UIImage *)image {
//    self.imageView.image = image;
//}

@end


