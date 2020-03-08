//
//  ViewController.m
//  ios_101208
//
//  Created by Apple on 2017/8/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"

@interface ViewController () <NSURLSessionDataDelegate>

@end



@implementation ViewController

- (IBAction)afnHttps:(UIButton *)sender {
    // 1, 创建
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    // 2
    [manager GET:@"https://www.apple.com" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}


- (IBAction)https:(UIButton *)sender {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error: %@", error);
        } else {
            NSLog(@"%@;  %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }] resume];
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    
    NSLog(@"%@", [NSThread currentThread]);
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        // 创建证书
        NSURLCredential *credential = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
        completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
    }
    // NSURLAuthenticationMethodServerTrust : 服务器信任
}

@end


