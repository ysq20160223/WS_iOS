//
//  ViewController.m
//  ios_100811
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 
 1, get : 参数一般不能超过 1kb
 
 2, post :
 
 */

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>

@property (strong, nonatomic) NSString *localUrl;

@end



@implementation ViewController

-(void)viewDidLoad {
    _localUrl = @"http://192.168.1.157:8080/Web/login?loginName=get&pwd=021&sleep=2000";
}


// 100816
- (IBAction)delegate {
    NSURL *url = [NSURL URLWithString:self.localUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 1
//    [NSURLConnection connectionWithRequest:request delegate:self];
    
    // 2
//    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    // 3
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [conn start];
}

#pragma mark - NSURLConnectionDataDelegate start
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"connection: %@; response: %@", connection, response);
}

// 可能被调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"connection: %@; data: %@", connection, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connection: %@", connection);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection: %@; error: %@", connection, error);
}
#pragma mark - NSURLConnectionDataDelegate end


// 100816 异步
- (IBAction)async {
    NSURL *url = [NSURL URLWithString:self.localUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // [NSOperationQueue mainQueue]  [[NSOperationQueue alloc] init]
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError);
        } else {
            NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
            NSLog(@"%@; response: %@; data: %@; encoding data: %@", [NSThread currentThread], response, data, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
}


// 100816 同步
- (IBAction)sync {
    NSLog(@"");
    
    // 1, 确定请求路径
    NSURL *url = [NSURL URLWithString:self.localUrl];
    
    // 2, 创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3, 发送请求
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSLog(@"response: %@", response);
}

@end


