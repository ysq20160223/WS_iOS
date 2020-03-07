//
//  ViewController.m
//  ios_101101
//
//  Created by Apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 上传文件的步骤
 1.设置请求头
 Content-Type: multipart/form-data; boundary=----WebKitFormBoundary35cxmtFcIglrlsad
 说明:----WebKitFormBoundary35cxmtFcIglrlsad  分隔符
 
 2.设置请求体
 // 文件参数
 --分隔符
 Content-Disposition: form-data; name="file"; filename="123.png"
 Content-Type: image/png
 空行
 文件数据
 
 // 非文件参数
 --分隔符
 Content-Disposition: form-data; name="username"
 空行
 yy
 
 // 结尾标识
 --分隔符--
 
 */

#import "ViewController.h"

#import <MobileCoreServices/MobileCoreServices.h>

#define kBoundary @"----WebKitFormBoundary35cxmtFcIglrlsad"
#define kNewLine [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tip;

@end



@implementation ViewController

- (IBAction)mimeTypeC:(UIButton *)sender {
    self.tip.text = [self mimeTypeForFileAtPath:@"/Users/Apple/Desktop/ios_basic.zip"];
}

- (NSString *)mimeTypeForFileAtPath:(NSString *)path {
    if (![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }
    
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)(MIMEType);
}


- (IBAction)mimeTypeSync:(UIButton *)sender {
    self.tip.text = [self mimeType:@"/Users/Apple/Desktop/url.docx"];
}

- (NSString *)mimeType:(NSString *)str {
    // 1
    NSURL *url = [NSURL fileURLWithPath:str];
    
    // 2, 创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //
    NSHTTPURLResponse *res = nil;
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:&res error:nil];
    
    return res.MIMEType;
}


- (IBAction)mimeTypeAsync:(UIButton *)sender {
    // 1
    NSURL *url = [NSURL fileURLWithPath:@"/Users/Apple/Desktop/bd_logo1.png"];
    
    // 2, 创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        self.tip.text = response.MIMEType;
    }];
}


- (IBAction)upload:(UIButton *)sender {
    // 1, 确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/doUpload"];
    
    // 2, 创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 3
    request.HTTPMethod = @"POST";
    
    request.timeoutInterval = 3.0;
    
    // 4, 设置请求头
    NSString *header = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", kBoundary];
    [request setValue:header forHTTPHeaderField:@"Content-Type"];
    
    // 5, 设置请求头
    NSMutableData *fileData = [NSMutableData data];
    
    // 5.1, 文件参数
    NSString *boundary = [NSString stringWithFormat:@"--%@", kBoundary];
    [fileData appendData:[boundary dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    //    [fileData appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"default_bd.png\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:[@"Content-Disposition: form-data; name=\"mPhoto\"; filename=\"bd_logo1.png\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    [fileData appendData:[@"Content-Type: image/png" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    [fileData appendData:kNewLine];
    [fileData appendData:kNewLine];
    
    UIImage *image = [UIImage imageNamed:@"bd_logo1"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [fileData appendData:imageData];
    [fileData appendData:kNewLine];
    
    // 5.2, 非文件参数 - 可以不传
    //    [fileData appendData:[boundary dataUsingEncoding:NSUTF8StringEncoding]];
    //    [fileData appendData:kNewLine];
    //    [fileData appendData:[@"Content-Disposition: form-data; name=\"username\"" dataUsingEncoding:NSUTF8StringEncoding]];
    //    [fileData appendData:kNewLine];
    //    [fileData appendData:kNewLine];
    //    [fileData appendData:kNewLine];
    //    [fileData appendData:[@"yy" dataUsingEncoding:NSUTF8StringEncoding]];
    //    [fileData appendData:kNewLine];
    
    // 5.3, 结尾标识
    [fileData appendData:[[NSString stringWithFormat:@"--%@--", kBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:kNewLine];
    
    request.HTTPBody = fileData;
    
    // 6,
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
        
        if (connectionError) {
            self.tip.text = @"Error";
        } else {
            NSString *tip = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            self.tip.text = tip;
        }
    }];
}

@end


