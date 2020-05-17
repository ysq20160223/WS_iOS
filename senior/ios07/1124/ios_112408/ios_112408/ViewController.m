//
//  ViewController.m
//  ios_112408
//
//  Created by Apple on 2018/3/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "IOSPerson.h"
#import "IOSCar.h"


#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

@interface ViewController ()

@property (nonatomic, copy) int (^xyz)(int, int, int); // 定义block属性

@end

@implementation ViewController

/*
 定义格式:
 返回值类型 (^block变量名)(形式参数列表, 不用变量名) = ^(形式参数列表, 要变量名) {
    // block代码
 }
 
 调用:
 block的变量名(实际参数列表);
 
 */

// block 当做参数传递
- (void)test:(void(^)()) block {
    block();
}

- (int)test1:(int(^)(int, int)) block1 :(int)a :(int)b{
    return block1(a, b);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self testBlock];
    
    
    
    IOSPerson *person = [[IOSPerson alloc] init];
    
    __weak IOSPerson *weakPerson = person;
    
    person.name = @"jack";
    person.block = ^ {
        NSLog(@"block begin");
        
        // 验证一: 直接在使用弱引用
//        NSLog(@"weak, name: %@", weakPerson.name);
        
        // 验证二: 这里使用强引用和弱引用(验证一)没有什么区别
//        IOSPerson *strongPerson = weakPerson;
//        NSLog(@"strong, name: %@", strongPerson.name);
        
        
        // 验证三:
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"dispatch_after weak, name: %@", weakPerson.name);
        });
        
        // 验证四: 这里使用强引用和弱引用(验证三)有区别
//        IOSPerson *strongPerson = weakPerson;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"dispatch_after strong, name: %@", strongPerson.name);
//        });
        
    }; // 定义
    // 如果  block内部  使用  外部声明的强引用  访问  对象A  , 那么  block内部  会自动产生一个强引用指向  对象A
    // 如果  block内部  使用  外部声明的弱引用  访问  对象A  , 那么  block内部  会自动产生一个弱引用指向  对象A

    
    person.block(); // 调用
    
    
    
}


- (void)testBlock {
    // ------------- 定义空参数 block
    void (^voidBlock)() = ^{
        NSLog(@"hehe");
    };
    
    //    voidBlock();
    [self test:voidBlock]; // 将 block 当做参数调用
    
    
    // ------------- 定义两个参数 block
    int (^sumBlock)(int, int) = ^(int a, int b) {
        return a + b;
    };
    //    NSLog(@"sum: %zd", sumBlock(1, 2));
    NSLog(@"--sum: %zd", [self test1:sumBlock :2 :3]) // 将 block 当做参数调用
    
    
    // ------------- 给属性 block 赋值
    _xyz = ^(int a, int b, int c) {
        return a + b + c;
    };
}


@end





