//
//  ViewController.m
//  ios_100802
//
//  Created by Apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//


/*
 1, RunLoop 与线程
 每条线程都有唯一的一个与之对应的 RunLoop 对象
 主线程的 RunLoop 已经自动创建, 子线程的 RunLoop 需要主动创建
 RunLoop 在第一次获取时创建, 在线程结束时销毁
 
 2, CFRunLoopModeRef
 代表 RunLoop 的运行模式
 一个 RunLoop 包含若干个 Mode, 每个 Mode 又包含若干个 Source/Timer/Oberver
 每次 RunLoop 启动时, 只能指定其中的一个 Mode ,这个 Mode 被称为 current mode
 如果需要切换 mode , 只能退出 Loop ,在重新指定一个 mode 进入
 
 3, CFRunLoopModeRef
 kCFRunLoopDefaultMode
 UITrackingRunLoopMode
 UIInitializationRunLoopMode
 GSEventReceiveRunLoopMode
 kCFRunLoopCommonModes
 
 4, CFRunLoopTimerRef
 CFRunLoopTimerRef 是基于时间的触发器
 基本上说是 NSTimer, 会受到 RunLoop 的 mode 的影响
 GCD 的定时器不受 RunLoop 的 mode 的影响
 
 5, CFRunLoopSourceRef
 Source0: 非基于Port, 用于用户主动触发的事件
 Source1: 基于 Port的, 通过内核和其它线程相互发送消息
 
 6, CFRunLoopOververRef
 是观察者, 能够监听 RunLoop 的状态改变
 
 */


#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_source_t gcd_timer;

@end



@implementation ViewController

//
- (IBAction)observer:(UIButton *)sender {
    // 创建一个监听者
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"Entry");
                break;
                
            case kCFRunLoopBeforeTimers:
                NSLog(@"Before Timers");
                break;
                
            case kCFRunLoopBeforeSources:
                NSLog(@"Before Sources");
                break;
                
            case kCFRunLoopBeforeWaiting:
                NSLog(@"Before Waiting");
                break;
                
            case kCFRunLoopAfterWaiting:
                NSLog(@"After Waiting");
                break;
                
            case kCFRunLoopExit:
                NSLog(@"Exit");
                break;
                
        }
    });
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(runObserver) userInfo:nil repeats:YES];
    
    CFRelease(observer); // 
}

- (void)runObserver {
    NSLog(@"%s", __func__);
}

//
- (IBAction)gcdTimer:(UIButton *)sender {
    // 1 创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 2, 创建一个 GCD 定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    self.gcd_timer = timer;
    
    // 3,
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"%s", __func__);
    });
    
    // 4,
    dispatch_resume(timer);
}

//
- (IBAction)nstimer:(UIButton *)sender {
    NSLog(@"%s", __func__);
    
    //    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    
    // 1
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    
    // 2, 定时器添加到当前 runloop 中, 并且选择默认运行模式
    //    0 : <CFString 0x10d2506c0 [0x10c227e40]>{contents = "UITrackingRunLoopMode"}
    //    2 : <CFString 0x10c1ff970 [0x10c227e40]>{contents = "kCFRunLoopDefaultMode"}
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode]; // 拖动 TextView 时, 定时器不工作
    
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode]; //
    
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    NSLog(@"%s --- %@", __func__, [NSRunLoop currentRunLoop]);
}

- (void)timer {
    NSLog(@"%s - %@", __func__, [NSRunLoop currentRunLoop].currentMode);
}

//
- (IBAction)threadRun:(UIButton *)sender {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    [thread start];
}

- (void)run {
    NSLog(@"%s - currentRunLoop:%@", __func__, [NSRunLoop currentRunLoop]);
    
}

//
- (IBAction)runLoop:(UIButton *)sender {
    // 1, 获得当前线程对应的 RunLoop
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    //    NSLog(@"currentRunLoop : %@", currentRunLoop);
    
    // 2, 获得住线程对应的 RunLoop
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    NSLog(@"%s - currentRunLoop : %p, mainRunLoop : %p", __func__, currentRunLoop, mainRunLoop);
    
    //
    //    CFRunLoopRef curLoop = CFRunLoopGetCurrent(); // 获得当前线程对应的 RunLoop
    //    CFRunLoopRef mainRunLoop = CFRunLoopGetMain(); // 获得主线程对应的 RunLoop
}

@end


