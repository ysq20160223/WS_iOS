//
//  ViewController.m
//  ios_101102
//
//  Created by Apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>

@end



@implementation ViewController

// --- 6 - 代理方法会不会执行看有没有把 conn 加入到当前线程中
- (IBAction)delegateThread:(UIButton *)sender {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@", [NSThread currentThread]);
        
        // 1
        NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
        
        // 2
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // 3 - 直接调用
        NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
//        [conn setDelegateQueue:[[NSOperationQueue alloc] init]]; // 设置代理方法在哪个线程中调用
        [conn setDelegateQueue:[NSOperationQueue mainQueue]]; // 设置代理方法在哪个线程中调用
        [[NSRunLoop currentRunLoop] run]; // 将 conn 加入到当前线程的 runloop
    });
}


// --- 5 - 代理方法会执行
- (IBAction)delegateThreadToggle:(UIButton *)sender {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@", [NSThread currentThread]);
        // 1
        NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
        
        // 2
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // 3 - 直接调用
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [conn setDelegateQueue:[[NSOperationQueue alloc] init]]; // 设置代理方法在哪个线程中调用
        [conn start]; // 如果当前对应的 runloop 不存在会自动创建一个
    });
}


// --- 4 - 代理方法会执行
- (IBAction)delegateNotMain:(UIButton *)sender {
    // 1
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
    
    // 2
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3 - 设置开关
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    [conn setDelegateQueue:[[NSOperationQueue alloc] init]]; // 设置代理方法在哪个线程中调用
    [conn start];
}


// --- 3
- (IBAction)delegateMain:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark NSURLConnectionDataDelegate start
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    NSLog(@"%@; %@", [NSThread currentThread], response);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@; %@", [NSThread currentThread], error);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}
#pragma mark NSURLConnectionDataDelegate end


// --- 2
- (IBAction)asyncNotMainQueue:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError);
        } else {
            NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
}


// --- 1
- (IBAction)asyncMainQueue:(UIButton *)sender {
    NSLog(@"");
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/mediaVideoList?sleep=1000"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@; %@", [NSThread currentThread], [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
    [dataTask resume];
    NSLog(@"");
}

@end


