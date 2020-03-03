//
//  ViewController.m
//  ios_100907
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)weather:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http:120.25.226.186:32812/weather?place=Beijing&place=Shanghai"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [@"username=小码哥&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    
    request.timeoutInterval = 15;
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError);
        } else {
            NSLog(@"%@", [NSString stringWithFormat:@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]]);
        }
    }];
}


- (IBAction)post:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http:120.25.226.186:32812/login2"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [@"username=小码哥&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError);
        } else {
            NSLog(@"%@", [NSString stringWithFormat:@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]]);
        }
    }];
    
}

//
- (IBAction)get:(UIButton *)sender {
    NSString *urlStr = @"http:120.25.226.186:32812/login2?username=小码哥&pwd=520it&type=JSON";
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError);
        } else {
            NSLog(@"%@", [NSString stringWithFormat:@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]]);
        }
    }];
}

@end


