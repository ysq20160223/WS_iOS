//
//  ViewController.m
//  ios_100911
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//


#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tip;

@property (assign, nonatomic) NSUInteger totalLength;
@property (assign, nonatomic) NSUInteger currentLength;

@property (strong, nonatomic) NSString *fullPath;

//@property (strong, nonatomic) NSFileHandle *handle;

@property (strong, nonatomic) NSOutputStream *output;

//
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@property (strong, nonatomic) NSURLConnection *connection;


@end

@implementation ViewController

- (IBAction)pause:(UIButton *)sender {
    [self.connection cancel];
    NSLog(@"pause currentLength : %zd", self.currentLength);
}

- (IBAction)start:(UIButton *)sender {
    
    // 1
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_01.mp4"];
    
    // 2
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-", self.currentLength];
    [request setValue:range forHTTPHeaderField:@"Range"];
    
    NSLog(@"%@", range);
    
    // 3
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    self.connection = connection;
    
}

// 1
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    // 点击 pause 后不会重新创建文件
    if (self.currentLength > 0) {
        return;
    }
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 1
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", caches);
    
    // 2
    NSString *fullPath = [caches stringByAppendingPathComponent:response.suggestedFilename];
    self.fullPath = fullPath;
    
    [manager createFileAtPath:fullPath contents:nil attributes:nil];
    
    //
    self.totalLength = response.expectedContentLength + self.currentLength;
    NSLog(@"expectedContentLength:%zd, totalLength : %zd", response.expectedContentLength, self.totalLength);
    
    // --
    // 创建文件句柄, 指向数据写入的文件
//    self.handle = [NSFileHandle fileHandleForWritingAtPath:self.fullPath];
//    [self.handle seekToEndOfFile]; // 指向文件的末尾
    
    // 创建输出流
    self.output = [NSOutputStream outputStreamToFileAtPath:self.fullPath append:YES];
    [self.output open];
}

// 2
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    self.currentLength += data.length;
    
//    [self.handle writeData:data]; // 写数据
    [self.output write:data.bytes maxLength:data.length];
    
    NSString *progress = [NSString stringWithFormat:@"%.0f%%", self.currentLength * 100.0 / self.totalLength];
    self.tip.text = progress;
    
    self.progress.progress = self.currentLength * 1.0 / self.totalLength;
    
}

// 3
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //    self.currentLength = 0;
    
//    [self.handle closeFile];
//    self.handle = nil;
    
    [self.output close];
    self.output = nil;
}

// 4
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //    self.currentLength = 0;
    
    self.tip.text = @"Error";
}


//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.currentLength = 0;
    
}


@end




