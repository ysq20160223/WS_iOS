//
//  ViewController.m
//  ios_101212
//
//  Created by Apple on 2017/9/2.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)call:(UIButton *)sender {
    // 1, 创建签名 : 方法名称|参数|返回
    NSMethodSignature *signature = [ViewController instanceMethodSignatureForSelector:@selector(call)];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    invocation.target = self;
    invocation.selector = @selector(call);
    
    [invocation invoke];
}

- (void)call {
    NSLog(@"");
}


#pragma mark -
- (IBAction)callWithNumber:(UIButton *)sender {
    // 1, 创建签名 : 方法名称|参数|返回
    NSMethodSignature *signature = [ViewController instanceMethodSignatureForSelector:@selector(callNumber:)];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    invocation.target = self;
    invocation.selector = @selector(callNumber:);
    
    //
    NSString *number = @"10086";
    [invocation setArgument:&number atIndex:2];
    
    [invocation invoke];
}

- (void)callNumber:(NSString *)number {
    NSLog(@"number: %@", number);
}


#pragma mark -
- (IBAction)callWithNumberAndContents:(UIButton *)sender {
    // 1, 创建签名 : 方法名称|参数|返回
    NSMethodSignature *signature = [ViewController instanceMethodSignatureForSelector:@selector(callNumber:andContents:)];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    invocation.target = self;
    invocation.selector = @selector(callNumber:andContents:);
    
    //
    NSString *number = @"10086";
    [invocation setArgument:&number atIndex:2];
    
    NSString *contents = @"hehe";
    [invocation setArgument:&contents atIndex:3];
    //
    
    [invocation invoke];
}

- (void)callNumber:(NSString *)number andContents:(NSString *)contents{
    NSLog(@"number: %@, contents: %@", number, contents);
}


#pragma mark -
- (IBAction)callWithNumberAndContentsAndStatus:(UIButton *)sender {
    // 1, 创建签名 : 方法名称|参数|返回
    NSMethodSignature *signature = [ViewController instanceMethodSignatureForSelector:@selector(callNumber:andContents:andStatus:)];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    invocation.target = self;
    invocation.selector = @selector(callNumber:andContents:andStatus:);
    
    //
    NSString *number = @"10086";
    [invocation setArgument:&number atIndex:2];
    
    NSString *contents = @"hehe";
    [invocation setArgument:&contents atIndex:3];
    
    NSString *status = @"1";
    [invocation setArgument:&status atIndex:4];
    [invocation invoke];
}

- (void)callNumber:(NSString *)number andContents:(NSString *)contents andStatus:(NSString *)status {
    NSLog(@"number: %@, contents: %@, status: %@", number, contents, status);
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 异常
//    @throw [NSException exceptionWithName:@"exceptionName" reason:@"exceptionReason" userInfo:nil];
//    @[][1];
}

@end


