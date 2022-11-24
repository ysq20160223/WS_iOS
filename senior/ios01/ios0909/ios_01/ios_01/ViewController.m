//
//  ViewController.m
//  ios01
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

@interface ViewController ()

- (IBAction)write:(UIButton *)sender;
- (IBAction)read:(UIButton *)sender;

@end



@implementation ViewController

- (IBAction)write:(UIButton *)sender {
    // 存储自定义对象使用归档
    Person *person = Person.alloc.init;
    person.age = 01;
    person.name = @"jj";
    
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"cachePath: %@", cachePath);
    
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"person.data"];
    
    // object : 需要归档的对象
    // file : 文件全路径
    // 任何对象都可以进行归档
    // 调用自定义对象的 encodeWithCoder:
    // 如果一个自定义对象需要归档, 必须遵守 NSCoding 协议, 并且实现协议方法
    
    [NSKeyedArchiver archiveRootObject:person toFile:filePath]; // [ˈɑ:kaɪv]
}


- (IBAction)read:(UIButton *)sender {
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"person.data"];
    Person *person =[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"person : %@", person);
}


@end


