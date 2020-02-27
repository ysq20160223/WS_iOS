//
//  ViewController.m
//  ios_092814
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"


/*
    对比 092807
 */
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (IBAction)btnClick:(UIButton *)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
        
        // 1
        /*
            App Transport Security Settings
                Allow Arbitrary Loads
         */
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/img/bd_logo1.png"];
        
        // 2
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 3
        UIImage *image = [UIImage imageWithData:data];
        
        // ---
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"%@", [NSThread currentThread]);
            self.imageView.image = image;
        });
    });
    
}

@end


/*
 - (IBAction)btnClick:(id)sender {
     [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"https://www.baidu.com/img/bd_logo1.png"];
 }

 - (void)run:(NSString *)uri {
     // 下载图片
     // 1, url
     NSURL *url = [NSURL URLWithString:uri];
     
     // 2, 下载图片
     NSData *data = [NSData dataWithContentsOfURL:url];
     
     // 3, 二进制转化为图片
     UIImage *image = [UIImage imageWithData:data];
     
     // 4, 在主线程中刷新 UI
     [self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
 }
 */

