//
//  ViewController.m
//  ios_101211
//
//  Created by Apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test.html" withExtension:nil];
    
    // 2
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //
    self.webView.delegate = self;
}

#pragma mark - UIWebViewDelegate start
- (void)webViewDidStartLoad:(UIWebView *)webView {

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // oc -> js
    NSLog(@"sum: %@", [self.webView stringByEvaluatingJavaScriptFromString:@"sum(1, 2);"]);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    NSLog(@"request : %@", request.URL.absoluteString);
    
    NSString *requestUrl = request.URL.absoluteString;
    NSLog(@"requestUrl: %@", requestUrl);
    
    NSString *h5calloc = @"h5calloc://";
    
    if ([requestUrl hasPrefix:h5calloc]) {
        // 1, 把方法名称取出
        NSString *method = [requestUrl substringFromIndex:h5calloc.length];
//        NSLog(@"method:%@", method);
        
        //
        NSArray *array = [method componentsSeparatedByString:@"?"];
//        NSLog(@"array : %@", array);
        
        method = [[array firstObject] stringByReplacingOccurrencesOfString:@"_" withString:@":"];
        
        SEL methodSEL = NSSelectorFromString(method);
        
        NSString *params = [array lastObject];
        NSArray *paramArray = [params componentsSeparatedByString:@"&"];
        
        // 2
        [self performSelector:methodSEL withObject:[paramArray firstObject] withObject:[paramArray lastObject]];
        return NO;
    } else {
        NSLog(@"not hasPrefix");
    }
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"error: %@", error);
}
#pragma mark - UIWebViewDelegate end



#pragma mark - js -> oc
- (void)callWithNumber:(NSString *)number {
    NSLog(@"number: %@", number);
}


- (void)callWithNumber:(NSString *)number andContents:(NSString *)contents {
    NSLog(@"number: %@, contents: %@", number, contents);
}

@end


