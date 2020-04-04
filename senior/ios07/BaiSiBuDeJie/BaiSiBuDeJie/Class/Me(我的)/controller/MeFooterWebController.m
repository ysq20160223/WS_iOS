//
//  MeFooterWebController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/31.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeFooterWebController.h"

@interface MeFooterWebController () <WKUIDelegate, WKNavigationDelegate>

@end



@implementation MeFooterWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSLog(@"%@", self.name);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    self.navigationItem.title = self.name;
    
    self.webView.UIDelegate = self;
    
    self.webView.navigationDelegate = self;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    XLog
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    XLog
    
}

@end


