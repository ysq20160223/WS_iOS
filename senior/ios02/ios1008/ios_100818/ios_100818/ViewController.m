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

@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@end



@implementation ViewController

- (IBAction)login:(UIButton *)sender {
//    NSLog(@"");
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    // 0
    if (self.loginNameField.text.length == 0) {
//        [SVProgressHUD showErrorWithStatus:self.loginNameField.placeholder maskType:SVProgressHUDMaskTypeBlack];
        
        [SVProgressHUD showErrorWithStatus:self.loginNameField.placeholder];
        [SVProgressHUD dismissWithDelay:5 completion:^{
//            NSLog(@"");
        }];
        return;
    }
    
    if (self.pwdField.text.length == 0) {
        NSLog(@"placeholder pwd: %@", self.pwdField.placeholder);
        
        [SVProgressHUD showErrorWithStatus:self.pwdField.placeholder];
        return;
    }
    
    // 1
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/login"];
    
    // 2
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 2.1
    request.HTTPMethod = @"POST";
    
    NSString *params = [NSString stringWithFormat:@"loginName=%@&pwd=%@", self.loginNameField.text, self.pwdField.text];
    
    // 2.2
    request.HTTPBody = [params dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"connectionError: %@", connectionError);
        } else {
            NSLog(@"response: %@", response);
        }
    }];
}

@end


