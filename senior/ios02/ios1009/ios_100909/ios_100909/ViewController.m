//
//  ViewController.m
//  ios_100909
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>

@property (assign, nonatomic) NSUInteger totalLength;
@property (assign, nonatomic) NSUInteger currentLength;

@property (strong, nonatomic) NSString *fullPath;

@property (strong, nonatomic) NSFileHandle *fileHandle;
@property (strong, nonatomic) NSURLConnection *urlConnection;


@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@end



@implementation ViewController

- (IBAction)pause:(UIButton *)sender {
    [self.urlConnection cancel];
    NSLog(@"pause currentLength: %zd", self.currentLength);
}

- (IBAction)start:(UIButton *)sender {
    // 1
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/media/video/nzha.mp4"];
    
    // 2
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-", self.currentLength];
    [request setValue:range forHTTPHeaderField:@"Range"];
    NSLog(@"range: %@", range);
    
    // 3
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    self.urlConnection = connection;
}

// 1
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // 点击 pause 后不会重新创建文件
    if (self.currentLength > 0) {
        return;
    }
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 1
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"cachePath: %@", cachePath);
    
    // 2
    NSString *fullPath = [cachePath stringByAppendingPathComponent:response.suggestedFilename];
    self.fullPath = fullPath;
    
    [manager createFileAtPath:fullPath contents:nil attributes:nil];
    
    //
    self.totalLength = response.expectedContentLength + self.currentLength;
    NSLog(@"expectedContentLength:%lld, totalLength : %zd", response.expectedContentLength, self.totalLength);
    
    // 创建文件句柄, 指向数据写入的文件
    self.fileHandle = [NSFileHandle fileHandleForWritingAtPath:self.fullPath];
    [self.fileHandle seekToEndOfFile]; // 指向文件的末尾
}

// 2
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.currentLength += data.length;
    
    [self.fileHandle writeData:data]; // 写数据
    
    NSString *progress = [NSString stringWithFormat:@"%.0f%%", self.currentLength * 100.0 / self.totalLength];
    self.tipLabel.text = progress;
    
    self.progress.progress = self.currentLength * 1.0 / self.totalLength;
}

// 3
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.fileHandle closeFile];
    self.fileHandle = nil;
    self.currentLength = 0;
}

// 4
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

@end


