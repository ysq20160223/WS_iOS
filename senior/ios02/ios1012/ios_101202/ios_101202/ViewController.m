//
//  ViewController.m
//  ios_101202
//
//  Created by Apple on 2017/8/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"

@interface ViewController ()

@end



@implementation ViewController

// 101202
- (IBAction)serializer:(UIButton *)sender {
    // 1
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 服务端的序列化 (默认 JSON)
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer]; // 服务端返回 XML
    NSLog(@"responseSerializer: %@", manager.responseSerializer);
    
    // 2
    NSString *url = @"http://192.168.1.157:8080/Web/login";
    NSDictionary *dict = @{
        @"loginName" : @"yy",
        @"pwd" : @"021",
        @"sleep" : @"1000"
    };
    
    [manager GET:url parameters:dict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress: %@", downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}


// 1
- (IBAction)upload_POST:(UIButton *)sender {
    NSDictionary *dict = @{
        @"loginName" : @"yy",
        @"pwd" : @"021",
        @"sleep" : @"1000"
    };
    
    NSString *localImagePath = [[NSBundle mainBundle] pathForResource:@"net_ease.png" ofType:nil];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy_MM_dd__HH_mm_ss"];
    NSString *curTime = [formatter stringFromDate:date];
//    NSLog(@"curTime: %@", curTime);
    NSString *uploadToServerFileName = [NSString stringWithFormat:@"net_ease_%@.png", curTime];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://192.168.1.157:8080/Web/doUpload" parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:localImagePath] name:@"mPhoto" fileName:uploadToServerFileName mimeType:@"image/png" error:nil];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress: %f", uploadProgress.fractionCompleted);
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error: %@; response: %@; responseObject: %@", error, response, responseObject);
        } else {
            NSLog(@"response: %@; responseObject: %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}

@end


