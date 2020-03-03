//
//  ViewController.m
//  ios_100904
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <AVKit/AVKit.h>

#import <MediaPlayer/MediaPlayer.h>

#import "BaseBean.h"
#import "Video.h"

#import "MJExtension.h"

#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSArray *videoArray;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _baseUrl = @"http://192.168.1.157:8080/Web/";
    
    // MJExtension 框架替换key
    [Video setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
    //
    
    // 1 mediaVideoList mediaAudioList
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@media/video/mediaVideoList", _baseUrl]];
    
    // 2
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        // 4
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        //        NSLog(@"dict: %@", dict);
        //
        NSArray *array = dict[@"video"]; // video audio
        NSLog(@"array: %@", array);
        
        // 存储数据
        //        [dict writeToFile:@"/Users/Apple/Desktop/mediaAudioList.plist" atomically:YES];
        
        
        // 使用自带 dictionary 转 model
//        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:array.count];
//        for (NSDictionary *dic in array) {
//            [mutableArray addObject:[Video videoWithDict:dic]];
//        }
//        self.videoArray = mutableArray;
        
        
        // 使用框架 dictionary 转 model
        self.videoArray = [Video objectArrayWithKeyValuesArray:array];
        
        // 5
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
    
    // 3
    [dataTask resume];
    
}

#pragma mark UITableViewDataSource

// data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"audio";
    
    // 1
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 2
    Video *video = self.videoArray[indexPath.row];
    NSLog(@"row: %ld, video: %@", indexPath.row, video);
    cell.textLabel.text = video.name;
    cell.detailTextLabel.text = video.author;
    
    
    NSURL *imageUrl = [NSURL URLWithString:[_baseUrl stringByAppendingPathComponent:video.albumPic]];
    //    NSLog(@"imageUrl: %@", imageUrl);
    [cell.imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"default"]];
    
    // 3
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoArray.count;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = self.videoArray[indexPath.row];
    
    NSURL *mp4Url = [NSURL URLWithString:[_baseUrl stringByAppendingPathComponent:video.url]];
    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
    vc.player = [AVPlayer playerWithURL:mp4Url];
    [vc.player play];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end


