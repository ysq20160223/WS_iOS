//
//  ViewController.m
//  ios_092815
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImage *imageFirst;
@property (nonatomic, strong) UIImage *imageSecond;

//
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (IBAction)dispatch_group {
    NSLog(@"%@", [NSThread currentThread]);
    
    // 创建队列组
    dispatch_group_t group  = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
        self.imageFirst = [self downloadImage:@"https://www.baidu.com/img/bd_logo1.png"];
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
        self.imageSecond = [self downloadImage:@"http://www.baidu.com/img/bd_logo1.png"];
    });
    

    // 合成
    dispatch_group_notify(group, queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
        
        // 开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(375, 400));
        
        [self.imageFirst drawInRect:CGRectMake(0, 0, 375 / 2, 200)];
        [self.imageSecond drawInRect:CGRectMake(375 / 2, 200, 375 / 2, 200)];
        
        // 关闭上下文
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@", [NSThread currentThread]);
            
            self.imageView.image = image;
        });
    });
}

- (UIImage *)downloadImage:(NSString *)url {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return [UIImage imageWithData:data];
}


// 8
- (IBAction)copyItemAtPath {
    // 在桌面创建 from / to 文件夹
    NSString *from = @"/Users/Apple/Desktop/from";
    NSString *to = @"/Users/Apple/Desktop/to";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subPaths = [manager subpathsAtPath:from];
    //    NSLog(@"subPaths : %@", subPaths);
    
    NSInteger count = [subPaths count];
    dispatch_queue_t queue = dispatch_queue_create("create", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_apply(count, queue, ^(size_t index) {
        NSLog(@"index: %zu, %@", index, [NSThread currentThread]);
        
        NSString *subPath = subPaths[index];
        
        NSString *fromFullPath = [from stringByAppendingPathComponent:subPath];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPath];
        
        [manager copyItemAtPath:fromFullPath toPath:toFullPath error:nil];
    });

//    NSDirectoryEnumerator *enumer = [manager enumeratorAtPath:to];
//    for (NSDirectoryEnumerator *en in enumer) {
//        NSLog(@"en : %@", en);
//    }
//
//    NSArray *enumerator = [manager directoryContentsAtPath:to];
//    for (NSDirectoryEnumerator *en in enumerator) {
//        NSLog(@"en : %@", en);
//    }
}


// 7, 在 UI 线程中剪切图片
- (IBAction)moveItemAtPath {
    // 在桌面创建 from / to 文件夹
    NSString *from = @"/Users/Apple/Desktop/from";
    NSString *to = @"/Users/Apple/Desktop/to";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subPaths = [manager subpathsAtPath:from];
    NSLog(@"subPaths: %@", subPaths);
    
    NSInteger count = [subPaths count];
    for (NSInteger i = 0; i < count; i++) {
        NSString *subPath = subPaths[i];
        
        NSString *fromFullPath = [from stringByAppendingPathComponent:subPath];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPath];
        
        [manager moveItemAtPath:fromFullPath toPath:toFullPath error:nil];
    }
}


// 6, 快速迭代
- (IBAction)dispatch_apply {
    dispatch_queue_t queue = dispatch_queue_create("create", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"index, %zu, %@", index, [NSThread currentThread]);
    });
}


// 5, 只执行一次
- (IBAction)dispatch_once {
    NSLog(@"%@", [NSThread currentThread]);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
}


// 4, 延时指定执行的线程
- (IBAction)dispatch_after {
    NSLog(@"%@", [NSThread currentThread]);
    
    // UI 线程中执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    // 非 UI 线程中执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)1.0 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
}


// 3, 定时函数
- (IBAction)scheduledTimerWithTimeInterval {
    NSLog(@"%@", [NSThread currentThread]);
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
}


// 2, 延迟函数
- (IBAction)afterDelay {
    NSLog(@"%@", [NSThread currentThread]);
    [self performSelector:@selector(run) withObject:nil afterDelay:2.0];
}

- (void)run {
    NSLog(@"%@", [NSThread currentThread]);
}


// 1, 栅栏函数
- (IBAction)barrierAsync {
    // 1, 创建队列
    dispatch_queue_t queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"1------ i: %d, %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"2++++++ i: %d, %@", i, [NSThread currentThread]);
        }
    });
    
    // 栅栏函数
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier --------------------------------------");
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"3^^^^^^ i: %d, %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"4~~~~~~ i = %d, %@", i, [NSThread currentThread]);
        }
    });
}

@end


