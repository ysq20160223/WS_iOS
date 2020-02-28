//
//  ViewController.m
//  ios_092911
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "XApp.h"

#import "UIImageView+WebCache.h"


@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *xAppArray;

@property (nonatomic, strong) NSMutableDictionary *imageCacheDict;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@property (strong, nonatomic) NSMutableDictionary *imageDownloadingOperationDict;

@end



@implementation ViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"app";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    XApp *app = self.xAppArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %@", indexPath.row, app.name];
    cell.detailTextLabel.text = app.download;
    
    
    // 使用框架
    //    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"default"]];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"default"] options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        NSLog(@"row: %ld, progress: %.2f", indexPath.row, 1.0 * receivedSize / expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"row: %ld, width: %f, height: %f", indexPath.row, image.size.width, image.size.height);
    }];
    
    //
    //    [self tableView:tableView showImage:cell indexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView showImage:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    XApp *app = self.xAppArray[indexPath.row];
    
    // 1, 读取内存缓存数据
    UIImage *cacheImage = [self.imageCacheDict objectForKey:app.icon];
    if (cacheImage) {
        NSLog(@"row: %ld, name: %@, image from cache", indexPath.row, app.name);
        cell.imageView.image = cacheImage;
    } else {
        // 2, 读取沙盒数据
        NSArray *cacheArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachePath = [cacheArray lastObject];
        NSString *imageCachePath = [cachePath stringByAppendingPathComponent:[app.icon lastPathComponent]]; // 拼接全路径
        
        NSData *domainData = [NSData dataWithContentsOfFile:imageCachePath];
        domainData = nil; // 忽略沙盒缓存
        
        if (domainData) {
            //            NSLog(@"row: %ld, imageCachePath: %@, name: %@, domain ---", indexPath.row, imageCachePath, app.name);
            NSLog(@"---row: %ld, name: %@, domain", indexPath.row, app.name);
            UIImage *domainImage = [UIImage imageWithData:domainData]; // 3
            cell.imageView.image = domainImage;
            [self.imageCacheDict setObject:domainImage forKey:app.icon]; // 保存到内存缓存
        } else {
            // 3, 网络下载
            cell.imageView.image = [UIImage imageNamed:@"default"]; // 显示默认图片
            
            // 是否正在下载 或 已经下载完成
            NSBlockOperation *operation = self.imageDownloadingOperationDict[app.icon];
            if (nil == operation) {
                NSBlockOperation *downloadOperation = [NSBlockOperation blockOperationWithBlock:^{
                    [NSThread sleepForTimeInterval:3.0];
                    
                    NSURL *url = [NSURL URLWithString:app.icon]; // 1
                    NSData *data = [NSData dataWithContentsOfURL:url]; // 2
                    if (nil == data) {
                        NSLog(@"row: %ld, download exception", indexPath.row);
                        [self.imageDownloadingOperationDict removeObjectForKey:app.icon]; // 下载出错, 移除
                        return;
                    }
                    UIImage *downloadedImage = [UIImage imageWithData:data]; // 3
                    
                    [self.imageCacheDict setObject:downloadedImage forKey:app.icon]; // 保存到内存缓存
                    [data writeToFile:imageCachePath atomically:YES]; // 保存到沙盒
                    
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        NSLog(@"------row: %ld, name: %@, download", indexPath.row, app.name);
                        
                        //                        cell.imageView.image = downloadedImage; // 会造成图片显示错乱
                        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone]; // 避免图片显示错乱
                    }];
                    
                    [self.imageDownloadingOperationDict removeObjectForKey:app.icon];
                }];
                
                [self.operationQueue addOperation:downloadOperation];
                self.imageDownloadingOperationDict[app.icon] = downloadOperation; // 存储正在下载的 URL
            }
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.xAppArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


// 延时加载
- (NSArray *)xAppArray {
    if (nil == _xAppArray) {
        NSArray *appPlistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        _xAppArray = [NSMutableArray arrayWithCapacity:appPlistArray.count];
        for (NSDictionary *dict in appPlistArray) {
            [_xAppArray addObject:[XApp appWithDict:dict]];
        }
    }
    return _xAppArray;
}

- (NSMutableDictionary *)imageCacheDict {
    if (nil == _imageCacheDict) {
        _imageCacheDict = [NSMutableDictionary dictionary];
    }
    return _imageCacheDict;
}

- (NSOperationQueue *)operationQueue {
    if (nil == _operationQueue) {
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.maxConcurrentOperationCount = 5;
    }
    return _operationQueue;
}

- (NSMutableDictionary *)imageDownloadingOperationDict {
    if (_imageDownloadingOperationDict == nil) {
        _imageDownloadingOperationDict = [NSMutableDictionary dictionary];
    }
    return _imageDownloadingOperationDict;
}


//
- (void)didReceiveMemoryWarning {
    NSLog(@"");
}

@end


