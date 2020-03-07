//
//  ViewController.m
//  ios_101103
//
//  Created by Apple on 2017/8/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDataDelegate>

@end



@implementation ViewController

#pragma mark 4 start

// --- 4
- (IBAction)delegate:(UIButton *)sender {
    // 1
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 2
  NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
    
    // 3
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    
    // 4
    [task resume];
}

#pragma mark - NSURLSessionDataDelegate start
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"%@", [NSThread currentThread]);
    completionHandler(NSURLSessionResponseAllow);
}

// 接收到服务器返回数据的时候调用, 该方法可能调用多次
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"%@; %@", [NSThread currentThread], error);
}
#pragma mark - NSURLSessionDataDelegate end


// --- 3, post
- (IBAction)dataTaskWithRequest_POST:(UIButton *)sender {
    // 1
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 2
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/login"];
    
    // 3
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"loginName=yy&pwd=021&sleep=1000" dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
    [task resume];
}


// --- 2, get
- (IBAction)dataTaskWithURL_GET:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
    
    // 内部会自动 URL 包装成一个请求对象, 是 get 请求
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
    
    [task resume];
}


// --- 1, get
- (IBAction)dataTaskWithRequest_GET:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];

    [task resume];
}

@end


