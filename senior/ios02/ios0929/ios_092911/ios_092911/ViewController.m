//
//  ViewController.m
//  ios_092911
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyApp.h"

#import "UIImageView+WebCache.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) NSArray *apps;

@property (nonatomic, strong) NSMutableDictionary *images;

@property (nonatomic, strong) NSOperationQueue *queue;

@property (strong, nonatomic) NSMutableDictionary *operations; // 已经下载的 URL

@end



@implementation ViewController

- (void)didReceiveMemoryWarning {
    NSLog(@"");
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"app";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    MyApp *app = self.apps[indexPath.row];
    
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    // 使用框架
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"default"]];

    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"default"] options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        NSLog(@"progress:%.2f", 1.0 * receivedSize / expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"width:%f, height:%f",image.size.width, image.size.height);
//        NSLog(@"completed");
    }];
    
    
    // /Users/Apple/Desktop/ios_senior/ios02/ios0929/ios_092911/ios_092911/SDWebImage/FLAnimatedImage/FLAnimatedImageView+WebCache.m:9:9: In file included from /Users/Apple/Desktop/ios_senior/ios02/ios0929/ios_092911/ios_092911/SDWebImage/FLAnimatedImage/FLAnimatedImageView+WebCache.m:9:
    
//    UIImage *imgCache = [self.images objectForKey:app.icon];
//    if (imgCache) {
//        // 1, 读取内存缓存数据
//        cell.imageView.image = imgCache;
//    } else {
//        // 缓存路径
//        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
////        NSLog(@"domain caches:%@", caches);
//        
//        NSString *fileName = [app.icon lastPathComponent];
//        
//        NSString *fullPath = [caches stringByAppendingPathComponent:fileName]; // 拼接全路径
//        
//        // 2, 读取沙盒数据
//        NSData *domainData = [NSData dataWithContentsOfFile:fullPath];
//        domainData = nil; // 忽略沙盒缓存
//        
//        if (domainData) {
//            UIImage *img = [UIImage imageWithData:domainData]; // 3
//            cell.imageView.image = img;
//            [self.images setObject:img forKey:app.icon]; // 保存到内存缓存
//        }
//        
//        // 3, 网络下载
//        cell.imageView.image = [UIImage imageNamed:@"default"]; // 显示默认图片
//        
//        // 是否正在下载
//        NSBlockOperation *op = self.operations[app.icon];
//        if (op == nil) {
//            NSBlockOperation *download = [NSBlockOperation blockOperationWithBlock:^{
//                NSURL *url = [NSURL URLWithString:app.icon]; // 1
//                NSData *data = [NSData dataWithContentsOfURL:url]; // 2
//                if (data == nil) {
//                    [self.operations removeObjectForKey:app.icon];
//                    return;
//                }
//                UIImage *img = [UIImage imageWithData:data]; // 3
//                // [NSThread sleepForTimeInterval:3.0]; // 这里延时会报错
//                [self.images setObject:img forKey:app.icon]; // 保存到内存缓存
//                [data writeToFile:fullPath atomically:YES]; // 保存到沙盒
//                
//                [NSThread sleepForTimeInterval:3.0]; //
//                
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    cell.imageView.image = img;
////                    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//                }];
//                
//                [self.operations removeObjectForKey:app.icon];
//            }];
//            
//            [self.queue addOperation:download];
//            self.operations[app.icon] = download; // 存储已经下载过的 URL
//            
//            NSLog(@"row : %ld", indexPath.row);
//        }
//        
//        
//    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}

// 延时加载

- (NSArray *)apps {
    if (_apps == nil) {
        NSArray *arrTemp = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        
        //
        NSMutableArray *appArrayTemp = [NSMutableArray arrayWithCapacity:arrTemp.count];
        
        for (NSDictionary *dict in arrTemp) {
            [appArrayTemp addObject:[MyApp appWithDict:dict]];
        }
        _apps = appArrayTemp;
        
        //        NSLog(@"_apps:%@", appArrayTemp);
    }
    return _apps;
}
- (NSMutableDictionary *)images {
    if (_images == nil) {
        _images = [NSMutableDictionary dictionary];
    }
    return _images;
}

- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 5;
    }
    return _queue;
}

- (NSMutableDictionary *)operations {
    if (_operations == nil) {
        _operations = [NSMutableDictionary dictionary];
    }
    return _operations;
}

@end


