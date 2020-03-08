//
//  ViewController.m
//  ios_101109
//
//  Created by Apple on 2017/8/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"

@interface ViewController ()

@end



@implementation ViewController

// 5
- (IBAction)download:(UIButton *)sender {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/media/video/nzha.mp4"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress) {
        NSLog(@"%@", downloadProgress);
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"response: %@; filePath: %@", response, filePath);
    }];
    [downloadTask resume];
    
}


// 2
- (IBAction)postRequestOperation:(UIButton *)sender {
    NSString *url = @"http://192.168.1.157:8080/Web/login";
    NSDictionary *dict = @{
        @"loginName" : @"哈哈yy",
        @"pwd" : @"0021",
        @"sleep" : @"1000"
    };
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager POST:url parameters:dict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress: %@", downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}

// 1
- (IBAction)getRequestOperation:(UIButton *)sender {
    NSLog(@"");

    NSString *url = @"http://192.168.1.157:8080/Web/login";
    NSDictionary *dict = @{
        @"loginName" : @"呵呵yy",
        @"pwd" : @"21",
        @"sleep" : @"1000"
    };
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager GET:url parameters:dict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress: %@", downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}

@end


