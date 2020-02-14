//
//  ViewController.m
//  ios_100818
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "SVProgressHUD.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *loginNameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UILabel *tip;

@end



@implementation ViewController

- (IBAction)login:(UIButton *)sender {
    // 0
    if (self.loginNameField.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:self.loginNameField.placeholder maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    
    if (self.passwordField.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:self.passwordField.placeholder maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    
    // 1
    NSURL *url = [NSURL URLWithString:@"http:192.168.1.117:8080/Web/login"];
    
    // 2
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 2.1
    request.HTTPMethod = @"POST";
    
    NSString *params = [NSString stringWithFormat:@"loginName=%@&password=%@", self.loginNameField.text, self.passwordField.text];
    
    // 2.2
    request.HTTPBody = [params dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            self.tip.text = @"Error";
        } else {
            NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
            NSString *str = [NSString stringWithFormat:@"statusCode:%zd,\r\nallHeaderFields:%@,\r\ndata:%@", res.statusCode, res.allHeaderFields, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
            self.tip.text = str;
        }
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}


@end


