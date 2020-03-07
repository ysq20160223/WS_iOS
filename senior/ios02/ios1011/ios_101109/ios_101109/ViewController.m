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
    
    
    
    //    // 1, 创建管理请求者
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //
    //    // 2
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/media/video/nzha.mp4"];
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //
    //    // @property int64_t totalUnitCount;
    //    // @property int64_t completedUnitCount;
    //    NSProgress *progress = nil;
    //
    //    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
    //        NSLog(@"%@", [NSThread currentThread]);
    //
    //        // 1
    //        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //        //        NSLog(@"caches = %@", caches);
    //
    //        // 2
    //        NSString *fullPath = [caches stringByAppendingPathComponent:response.suggestedFilename];
    //
    //        NSURL *url = [NSURL fileURLWithPath:fullPath];
    //
    //        return url;
    //    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
    //        NSLog(@"filePath: %@", filePath);
    //    }];
    //
    //    [progress addObserver:self forKeyPath:@"completedUnitCount" options:kNilOptions context:nil];
    //
    //    [downloadTask resume];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(NSProgress *)progress change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"progress: %f - %@", 1.0 * progress.completedUnitCount / progress.totalUnitCount, [NSThread currentThread]);
}


// 2
- (IBAction)postRequestOperation:(UIButton *)sender {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    
    NSURL *URL = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/login"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPBody = [@"loginName=yy&pwd=021&sleep=1000" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"error: %@; response: %@; responseObject: %@", error, response, responseObject);
        } else {
            NSLog(@"response: %@; responseObject: %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

// 1
- (IBAction)getRequestOperation:(UIButton *)sender {
    NSLog(@"");
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //    NSURL *URL = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/media/video/video_list.json"];
    NSURL *URL = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/login?loginName=yy&pwd=021&sleep=1000"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"error: %@; response: %@; responseObject: %@", error, response, responseObject);
        } else {
            NSLog(@"response: %@; responseObject: %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

@end


