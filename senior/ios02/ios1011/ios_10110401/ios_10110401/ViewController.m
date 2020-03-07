//
//  ViewController.m
//  ios_10110401
//
//  Created by Apple on 2017/8/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"


#define kFileName @"LitterYellow.mp4"
#define kFileTotalLength @"FileTotalLength"

@interface ViewController () <NSURLSessionDataDelegate>

@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSURLSessionDataTask *dataTask;

@property (strong, nonatomic) NSOutputStream *output;

@property (assign, nonatomic) NSInteger totalLength;
@property (assign, nonatomic) NSInteger currentLength;

//
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // 2
    NSString *fullPath = [caches stringByAppendingPathComponent:kFileTotalLength];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:fullPath];
    
    if (dict) {
        NSInteger total = [[dict objectForKey:kFileTotalLength] integerValue];
        self.totalLength = total;
    }
    if (self.totalLength != 0) {
        self.progressView.progress = 1.0 * [self getCurrent] / [self totalLength];
        self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%", 100.0 * [self getCurrent] / [self totalLength]];
    }
}

// 继续下载
- (IBAction)continueDownload:(UIButton *)sender {
    [self.dataTask resume];
}

// 暂停
- (IBAction)suspend:(UIButton *)sender {
    [self.dataTask suspend];
}

// 下载
- (IBAction)download:(UIButton *)sender {
    [self.dataTask resume];
}


// 保存已下载文件大小
- (NSInteger)getCurrent {
    // 1 - 缓存文件
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // 2 - 缓存完整路径
    NSString *fullPath = [caches stringByAppendingPathComponent:kFileName];
    
    //
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDictionary *dict = [manager attributesOfItemAtPath:fullPath error:nil];
    //    NSLog(@"dict : %@", dict);
    return [dict[@"NSFileSize"] integerValue];
}


// 保存文件总大小到沙盒
- (void)saveTotalLength:(NSUInteger)length {
    // 1
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // 2
    NSString *fullPath = [caches stringByAppendingPathComponent:kFileTotalLength];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@(length) forKey:kFileTotalLength];
    [dict writeToFile:fullPath atomically:YES];
}

#pragma mark lazy load start
- (NSURLSession *)session {
    if (_session == nil) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

- (NSURLSessionDataTask *)dataTask {
    if (_dataTask == nil) {
        self.currentLength = [self getCurrent];
        NSLog(@"download currentLength = %zd", self.currentLength);
        
        // 2, 创建task
        NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/video/nzha.mp4"];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.timeoutInterval = 3;
        NSString *header = [NSString stringWithFormat:@"bytes=%zd-", self.currentLength];
        //    NSLog(@"header = %@", header);
        
        [request setValue:header forHTTPHeaderField:@"Range"];
        
        _dataTask = [self.session dataTaskWithRequest:request];
    }
    return _dataTask;
}

#pragma mark lazy load end


#pragma mark NSURLSessionDataDelegate start
// 1, 接收到服务器响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"%@", [NSThread currentThread]);
    
    self.totalLength = response.expectedContentLength + self.currentLength; // 文件大小
    [self saveTotalLength:self.totalLength];
    
    // 1 - 缓存文件
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"caches = %@", cachePath);
    
    // 2 - 缓存完整路径
    NSString *fullPath = [cachePath stringByAppendingPathComponent:kFileName];
    
    // 1 - 创建输出流
    self.output = [[NSOutputStream alloc] initToFileAtPath:fullPath append:YES];
    [self.output open];
    
    completionHandler(NSURLSessionResponseAllow);
}

// 2, 接收到服务器返回数据的时候调用, 该方法可能调用多次
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    self.currentLength += data.length;
    
    [self.output write:data.bytes maxLength:data.length];
    
    NSLog(@"%f", 1.0 * self.currentLength / self.totalLength);
    self.progressView.progress = 1.0 * self.currentLength / self.totalLength;
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%", 100.0 * self.currentLength / self.totalLength];
}

// 3, 当请求完成之后调用, 如果错误, 那么 error 不为空
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"%@; error: %@", [NSThread currentThread], error);
    [self.output close];
}
#pragma mark NSURLSessionDataDelegate end

@end


