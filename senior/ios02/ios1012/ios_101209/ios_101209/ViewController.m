//
//  ViewController.m
//  ios_101209
//
//  Created by Apple on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackBarBtnItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForwardBarBtnItem;

@end



@implementation ViewController

- (IBAction)refresh:(id)sender {
    NSString *address = self.addressField.text;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:address]];
    
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test.html" withExtension:nil];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

- (IBAction)goForward:(id)sender {
    NSLog(@"");
    
    [self.webView goForward];
}

- (IBAction)goBack:(id)sender {
    NSLog(@"");
    
    [self.webView goBack];
}


// 1, 开始加载的时候调用
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"");
    
}

// 2, 加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"");
    self.goBackBarBtnItem.enabled = self.webView.canGoBack;
    self.goForwardBarBtnItem.enabled = self.webView.canGoForward;
}

// 3, 加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"");
}

// 每次请求的时候都会登陆
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"url: %@", request.URL.absoluteString);
    
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [self refresh:nil];
}

@end


