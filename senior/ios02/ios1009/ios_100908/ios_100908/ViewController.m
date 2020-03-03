//
//  ViewController.m
//  ios_100908
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//
@property (strong, nonatomic) NSMutableData *fileMutableData;
@property (assign, nonatomic) NSInteger currentLength;
@property (assign, nonatomic) NSInteger totalLength;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end



@implementation ViewController

- (IBAction)download:(UIButton *)sender {
    // 1
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    
    // 2
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3
    [NSURLConnection connectionWithRequest:request delegate:self];
}

// 1
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.fileMutableData = [NSMutableData data];
    self.totalLength = response.expectedContentLength; // 总长度
    
    NSLog(@"total length: %zd", self.totalLength);
}

// 2
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.fileMutableData appendData:data];
    self.currentLength = self.fileMutableData.length;
    
    NSString *progress = [NSString stringWithFormat:@"%.2f%%", self.currentLength * 100.0 / self.totalLength];
    self.progressLabel.text = progress;
}

// 3
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // 1
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"cachePath: %@", cachePath);
    
    // 2
    NSString *fullPath = [cachePath stringByAppendingPathComponent:@"download"];
    
    // 3
    [self.fileMutableData writeToFile:fullPath atomically:YES];
    
//    self.imageView.image = [UIImage imageWithData:self.fileData];
}

// 4
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"");
}


- (IBAction)nsurlConnection:(UIButton *)sender {
    // 1
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    
    // 2
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (data) {
            self.imageView.image =  [UIImage imageWithData:data];
        }
    }];
}

- (IBAction)nsdata:(UIButton *)sender {
    // 1
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    
    // 2
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    // 3
    self.imageView.image = [UIImage imageWithData:data];
}

- (IBAction)clear:(UIButton *)sender {
    self.imageView.image = [UIImage imageNamed:@"default_bd"];
}

@end


