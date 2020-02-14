//
//  ViewController.m
//  ios_092815
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//
@property (nonatomic, strong) UIImage *imageBD;
@property (nonatomic, strong) UIImage *imageQMoon;

//
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end



@implementation ViewController


- (IBAction)btnClick:(UIButton *)sender {
//    [self barrierAsync]; // 栅栏函数
    
//    [self afterDelay]; // 延迟函数
    
//    [self timer];
    
//    [self after];
    
//    [self once];
    
//    [self apply];
    
//    [self moveFileOnUI];
    
//    [self moveFileDispatch];
    
    [self group];
}

- (void)group {
    // 创建队列组
    dispatch_group_t group  = dispatch_group_create();
    
    //
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        self.imageQMoon = [self downloadImage:@"http://cache.qinsmoon.com/a/qinsmoon/downloads/wallpaper/2016-02-29/e06143824ed6bc953f6668aca4422a5a.jpg"];
    });
    
    dispatch_group_async(group, queue, ^{
        self.imageBD = [self downloadImage:@"https://www.baidu.com/img/bd_logo1.png"];
    });

    // 合成
    dispatch_group_notify(group, queue, ^{
        // 开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(375, 402));
        
        [self.imageQMoon drawInRect:CGRectMake(0, 0, 375, 223)];
        
        [self.imageBD drawInRect:CGRectMake(0, 223, 375, 179)];
        
        // 关闭上下文
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        //
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
        
    });
    
}

- (UIImage *)downloadImage:(NSString *)url {
    // 1
    NSURL *nsUrl = [NSURL URLWithString:url];
    
    // 2
    NSData *data = [NSData dataWithContentsOfURL:nsUrl];
    
    // 3
    return [UIImage imageWithData:data];
}

- (void)moveFileDispatch {
    // 在桌面创建 from / to 文件夹
    NSString *from = @"/Users/Apple/Desktop/from";
    NSString *to = @"/Users/Apple/Desktop/to";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subPaths = [manager subpathsAtPath:from];
    //    NSLog(@"subPaths : %@", subPaths);
    
    NSInteger count = [subPaths count];
    
    //
    dispatch_queue_t queue = dispatch_queue_create("create", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_apply(count, queue, ^(size_t index) {
        NSLog(@"%s - index = %zu - thread:%@", __func__, index, [NSThread currentThread]);
        
        NSString *subPath = subPaths[index];
        
        NSString *fromFullPath = [from stringByAppendingPathComponent:subPath];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPath];
        
        [manager moveItemAtPath:fromFullPath toPath:toFullPath error:nil];
    });
    
    // --
    NSDirectoryEnumerator *enumer = [manager enumeratorAtPath:to];
    for (NSDirectoryEnumerator *en in enumer) {
        NSLog(@"en : %@", en);
    }
    // --
    NSArray *enumerator = [manager directoryContentsAtPath:to];
    for (NSDirectoryEnumerator *en in enumerator) {
        NSLog(@"en : %@", en);
    }
    // --
    
}

// 在 UI 线程中剪切图片
- (void)moveFileOnUI {
    // 在桌面创建 from / to 文件夹
    NSString *from = @"/Users/Apple/Desktop/from";
    NSString *to = @"/Users/Apple/Desktop/to";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subPaths = [manager subpathsAtPath:from];
//    NSLog(@"subPaths : %@", subPaths);
    
    NSInteger count = [subPaths count];
    
    for (NSInteger i = 0; i < count; i++) {
        NSString *subPath = subPaths[i];
        
        NSString *fromFullPath = [from stringByAppendingPathComponent:subPath];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPath];
        
        [manager moveItemAtPath:fromFullPath toPath:toFullPath error:nil];
    }
}

// 快速迭代
- (void)apply {
    dispatch_queue_t queue = dispatch_queue_create("create", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"index = %zu - thread:%@", index, [NSThread currentThread]);
    });
}

// 只执行一次
- (void)once {
    NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
    });
}

// 延时指定执行的线程
- (void)after {
    
    NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
    
    // UI 线程中执行
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
//    });
    
    // 非 UI 线程中执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)1.0 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
    });
    
}

// 定时函数
- (void)timer {
    NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
}

// 延迟函数
- (void)afterDelay {
    NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
    [self performSelector:@selector(run) withObject:nil afterDelay:2.0];
}

- (void)run {
    NSLog(@"%s - thread:%@", __func__, [NSThread currentThread]);
}


// 栅栏函数
- (void)barrierAsync {
    // 1, 创建队列
    dispatch_queue_t queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"1 - i = %d, %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"2 - i = %d, %@", i, [NSThread currentThread]);
        }
    });
    
    // 栅栏函数
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier");
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"3 - i = %d, %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"4 - i = %d, %@", i, [NSThread currentThread]);
        }
    });
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}


@end


