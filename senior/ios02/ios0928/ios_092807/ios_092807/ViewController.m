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


- (IBAction)btnClick:(id)sender {
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"https://www.baidu.com/img/bd_logo1.png"];
    
    //    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"http://cache.qinsmoon.com/a/qinsmoon/downloads/wallpaper/2016-02-29/e06143824ed6bc953f6668aca4422a5a.jpg"];
}

- (void)run:(NSString *)uri {
    NSLog(@"uri: %@", uri);
    
    // 下载图片
    // 1, url
    NSURL *url = [NSURL URLWithString:uri];
    
    // 2, 下载图片
//    NSDate *startDate = [NSDate date];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSLog(@"time = %f", [[NSDate date] timeIntervalSinceDate:startDate]);
    
    //
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSLog(@"CFAbsoluteTime: %f", CFAbsoluteTimeGetCurrent() - start);
    
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


