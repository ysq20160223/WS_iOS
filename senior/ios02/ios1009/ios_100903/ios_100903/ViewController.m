//
//  ViewController.m
//  ios_100903
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (IBAction)get:(UIButton *)sender {
    // 1
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.157:8080/Web/login?loginName=get&pwd=021&sleep=1000"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"%@", error);
        } else {
//            NSLog(@"%@;\r\n response: %@;\r\n data: %@;\r\n encoding data: %@", [NSThread currentThread], response, data, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
        
        // 把 json 转化为 oc 对象
        // 第二个参数 : 可选配置参数
        // NSJSONReadingMutableContainers : 生成的是可变的字典或数组
        // NSJSONReadingMutableLeaves : 内部元素的字符串也是可变的, IOS7
        // NSJSONReadingAllowFragments : 如果最外层不是字典或数组那么就必须用这个
        // kNilOptions : 默认
        
        //      json         oc
        //      {}           @{}
        //      []           @[]
        //      ""           @""
        //      true/false   NSNumber
        //      null         NSNull == nil
        NSLog(@"isValidJSONObject: %d", [NSJSONSerialization isValidJSONObject:data]);
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"dict: %@", dict);
        
        [self oc2JSON:dict];
    }];
    [dataTask resume];
}

// oc 模型转 json 字符串
- (void)oc2JSON:(NSDictionary *)dict {
    // 1, 最外层是字典或数组
    // 2, 元素必须是 NSString, NSNumber, NSArray, NSDictionary, or NSNull
    // 3, 所有字典的所有 key 都必须是 NSString
    // 4, NSNumber 不能是 NaN 或者 无穷大
    
    BOOL isValid = [NSJSONSerialization isValidJSONObject:dict];
    NSLog(@"oc2JSON isValid: %d", isValid);
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

@end


