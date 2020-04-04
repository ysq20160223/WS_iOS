//
//  MeFooterWebController.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/31.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <WebKit/WebKit.h>

@interface MeFooterWebController : UIViewController

@property (weak, nonatomic) IBOutlet WKWebView *webView;

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *name;

@end

