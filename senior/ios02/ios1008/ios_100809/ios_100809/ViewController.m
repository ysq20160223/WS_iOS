//
//  ViewController.m
//  ios_100809
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyThread.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) MyThread *thread;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"%@", [NSRunLoop currentRunLoop]);
    
    // _wrapRunLoopWithAutoreleasePoolHandler
    // activities = 0xa0 :
    // activities = 0x1 :
    
}

//
- (IBAction)threadRun:(UIButton *)sender {
    MyThread *thread = [[MyThread alloc] initWithTarget:self selector:@selector(runThread) object:nil];
    [thread start];
    
    self.thread = thread;
    
}

- (void)runThread {
    NSLog(@"%s", __func__);
    
//    while (1) {
//        sleep(1.0);
//        NSLog(@"%@", [NSThread currentThread]);
//    }
    
    // 1, 子线程的 runloop 需要手动创建
    // 2, 子线程的 runloop 是需要主动开启的
    // 3, 子线程的 runloop 里面至少要有一个 source 或者是 timer, 不能是 observer
    
//    [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode]; // 添加 source
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    [[NSRunLoop currentRunLoop] run];
    
}

- (void)timer {
    NSLog(@"%s - %@", __func__, [NSThread currentThread]);
    
}

- (IBAction)runAnotherTask:(UIButton *)sender {
    NSLog(@"%s", __func__);
    
    // 线程只能执行第一次封装的任务, 不能尝试重新执行
    [self performSelector:@selector(runAnother) onThread:self.thread withObject:nil waitUntilDone:YES];
    
//    [self.thread start]; // 不能重新开启线程
}

- (void)runAnother {
    NSLog(@"%s - %@", __func__, [NSThread currentThread]);
    
}

//
- (IBAction)afterDelay:(UIButton *)sender {
    [self.imageView setImage:[UIImage imageNamed:@"yy_002_3"]];
    
    // 默认是在 default 模式下
//    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"yy_003_3"] afterDelay:2.0];
    
    //
    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"yy_003_3"] afterDelay:2.0 inModes:@[ UITrackingRunLoopMode]];
    
    //
//    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"yy_003_3"] afterDelay:2.0 inModes:@[NSDefaultRunLoopMode, UITrackingRunLoopMode]];
    
}


@end


