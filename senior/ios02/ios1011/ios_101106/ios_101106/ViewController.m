//
//  ViewController.m
//  ios_101106
//
//  Created by Apple on 2017/8/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#define kBoundary @"----WebKitFormBoundary35cxmtFcIglrlsad"
#define kNewLine [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]

@interface ViewController () <NSURLSessionDataDelegate>

@property (strong, nonatomic) NSURLSession *session;

@end



@implementation ViewController

// 2
- (IBAction)uploadDelegate:(UIButton *)sender {
    NSLog(@"");
    
    // 2, 创建 task
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/doUpload"];
    
    // 2.1 创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 2.2 设置请求
    request.HTTPMethod = @"POST";
    
    // 2.3 设置请求头
    NSString *header = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", kBoundary];
    [request setValue:header forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionUploadTask *uploadTask = [self.session uploadTaskWithRequest:request fromData:[self getBody]];
    
    // 3
    [uploadTask resume];
}

#pragma mark - NSURLSessionDataDelegate start
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    NSLog(@"%@; progress: %f", [NSThread currentThread], 1.0 * totalBytesSent / totalBytesExpectedToSend);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"erroor: %@", error);
}
#pragma mark - NSURLSessionDataDelegate end


// 1
- (IBAction)upload:(UIButton *)sender {
    // 1, 创建 session
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 2, 创建 task
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/doUpload"];
    
    // 2.1 创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 2.2 设置请求
    request.HTTPMethod = @"POST";
    
    // 2.3 设置请求头
    NSString *header = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", kBoundary];
    [request setValue:header forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:[self getBody] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@; %@", [NSThread currentThread], error);
        } else {
            NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
    
    // 3
    [uploadTask resume];
}

- (NSData *)getBody {
    // 5, 设置请求头
    NSMutableData *fileData = [NSMutableData data];
    
    // 5.1, 文件参数
    NSString *boundary = [NSString stringWithFormat:@"--%@", kBoundary];
    [fileData appendData:[boundary dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    //    [fileData appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"default_bd.png\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:[@"Content-Disposition: form-data; name=\"mPhoto\"; filename=\"ios_101106.png\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    [fileData appendData:[@"Content-Type: image/png" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    [fileData appendData:kNewLine];
    [fileData appendData:kNewLine];
    
    UIImage *image = [UIImage imageNamed:@"bd_logo1"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [fileData appendData:imageData];
    [fileData appendData:kNewLine];
    
    // 5.3, 结尾标识
    [fileData appendData:[[NSString stringWithFormat:@"--%@--", kBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    
    return fileData;
}

#pragma mark lazy load
- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 5;
        config.allowsCellularAccess = YES; // 蜂窝网络
        
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}


- (void)dealloc {
    [self.session invalidateAndCancel]; // 释放 session
//    [self.session resetWithCompletionHandler:nil];
}

@end


