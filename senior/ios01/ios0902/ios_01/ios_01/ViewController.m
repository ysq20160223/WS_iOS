//
//  ViewController.m
//  ios_01
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 获取当前的版本号
    // 1 - 第一种方法
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"Info.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:fullPath];
    
//    NSLog(@"dict = %@", dict);
    NSLog(@"CFBundleShortVersionString: %@", dict[@"CFBundleShortVersionString"]);
    
    // 2 - 第二种方法
    NSString *version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSLog(@"version: %@", version);
    
}


@end




