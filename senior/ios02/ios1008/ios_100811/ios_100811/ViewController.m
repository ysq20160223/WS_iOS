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

@property (weak, nonatomic) IBOutlet UITextView *tip;

@end



@implementation ViewController


- (IBAction)get:(UIButton *)sender {
//    [self sync];
    
    [self async];
    
//    [self delegate];
    
}

- (void)delegate {
    NSURL *url = [NSURL URLWithString:@"http:192.168.1.117:8080/Web/login?loginName=get&password=021"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 1
//    [NSURLConnection connectionWithRequest:request delegate:self];
    
    // 2
//    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    // 3
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [conn start];
    
}

// 代理方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
}

// 可能被调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData");
    
    self.tip.text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
}

// 异步
- (void)async {
    NSURL *url = [NSURL URLWithString:@"http:192.168.1.117:8080/Web/login?loginName=get&password=021"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            self.tip.text = @"Error";
        } else {
            NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
            NSString *str = [NSString stringWithFormat:@"statusCode:%zd, allHeaderFields:%@, data:%@", res.statusCode, res.allHeaderFields, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
            self.tip.text = str;
        }
    }];
}

// 同步
- (void)sync {
    // 1, 确定请求路径
    NSURL *url = [NSURL URLWithString:@"http:192.168.1.117:8080/Web/login?loginName=get&password=021"];
    
    // 2, 创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3, 发送请求
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSLog(@"response:%@", response);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}


@end


