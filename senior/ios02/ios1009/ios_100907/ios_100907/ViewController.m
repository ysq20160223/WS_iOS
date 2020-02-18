//
//  ViewController.m
//  ios_100907
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tip;

@end



@implementation ViewController

- (IBAction)weather:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http:120.25.226.186:32812/weather?place=Beijing&place=Shanghai"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [@"username=小码哥&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    
    request.timeoutInterval = 15;
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *tip = nil;
        if (connectionError) {
            tip = @"weather - Error";
        } else {
            tip = [NSString stringWithFormat:@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]];
        }
        self.tip.text = tip;
        
    }];
}

//
- (IBAction)post:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http:120.25.226.186:32812/login2"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [@"username=小码哥&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *tip = nil;
        if (connectionError) {
            tip = @"POST - Error";
        } else {
            tip = [NSString stringWithFormat:@"POST - %@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]];
        }
        self.tip.text = tip;
    }];
    
}

//
- (IBAction)get:(UIButton *)sender {
    NSString *urlStr = @"http:120.25.226.186:32812/login2?username=小码哥&pwd=520it&type=JSON";
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *tip = nil;
        if (connectionError) {
            tip = @"GET - Error";
        } else {
            tip = [NSString stringWithFormat:@"GET - %@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]];
        }
        self.tip.text = tip;
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tip.editable = NO;
    
}


@end


