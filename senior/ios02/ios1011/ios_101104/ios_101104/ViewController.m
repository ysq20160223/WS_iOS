//
//  ViewController.m
//  ios_101104
//
//  Created by Apple on 2017/8/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    1, 实现断点续传下载
    2, 无法实现用户退出应用断点续传下载 (用户没有点击暂停直接退出的情况下)
 */

#import "ViewController.h"

@interface ViewController () <NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
//
@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSURLSession *session;

@end



@implementation ViewController

- (IBAction)continueDownload:(UIButton *)sender {
    NSLog(@"%@", [NSThread currentThread]);
    self.downloadTask = [self.session downloadTaskWithResumeData:self.data];
    [self.downloadTask resume];
}

- (IBAction)suspend:(UIButton *)sender {
    NSLog(@"%@", [NSThread currentThread]);
    
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.data = resumeData;
        NSLog(@"resumeData: %@", resumeData);
    }];
}

- (IBAction)start:(UIButton *)sender {
    NSLog(@"%@", [NSThread currentThread]);
    
    // 1, 创建 session
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    
    // 2, 创建 task
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/video/nzha.mp4"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:3];
    self.downloadTask = [self.session downloadTaskWithRequest:request];
    
    // 3, 启动
    [self.downloadTask resume];
}

#pragma mark NSURLSessionDownloadDelegate start
// 1 - 当接收数据, 写数据调用
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.progressView.progress = 1.0 * totalBytesWritten / totalBytesExpectedToWrite;
        NSLog(@"progress: %f", self.progressView.progress);
    }];
}

// 2 - 恢复下载的时候调用
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    NSLog(@"%@", [NSThread currentThread]);
}

// 3 - 下载完成后调用
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"%@", [NSThread currentThread]);
    
    // 1
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"caches: %@", cachePath);
    
    // 2
    NSString *fullPath = [cachePath stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    
    // 剪切文件到目的地
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPath] error:nil];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"%@, %@", [NSThread currentThread], error);
}
#pragma mark NSURLSessionDownloadDelegate end

@end


