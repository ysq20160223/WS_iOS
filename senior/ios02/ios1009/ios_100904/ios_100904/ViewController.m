//
//  ViewController.m
//  ios_100904
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+WebCache.h"

#import <MediaPlayer/MediaPlayer.h>

#import "MyVideo.h"

#import "MJExtension.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *videos;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [MyVideo setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
    
    // 1
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video?type=JSON"];
    
    // 2
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // 3
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
//        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        // 4
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//        NSLog(@"dict:%@", dict);
        
        [dict writeToFile:@"/Users/Apple/Desktop/video.plist" atomically:YES];
        
        NSArray *array = dict[@"videos"];
        
        // dictionary 转 model
//        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:array.count];
//        for (NSDictionary *dic in array) {
//            [mutableArray addObject:[MyVideo videoWithDict:dic]];
//        }
//        self.videos = mutableArray;
//        NSLog(@"videos:%@", self.videos);
        
        // 使用框架 dictionary 转 model
        self.videos = [MyVideo objectArrayWithKeyValuesArray:array];
        
        // 5
        [self.tableView reloadData];
    }];
    
}

#pragma mark UITableViewDataSource

// data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"%s", __func__);
    
    static NSString *ID = @"video";
    
    // 1
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2
//    NSDictionary *videoDict = self.videos[indexPath.row];
//    cell.textLabel.text = videoDict[@"name"];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", videoDict[@"length"]];
//    
//    NSString *baseUrl = @"http://120.25.226.186:32812/";
//    NSURL *imageUrl = [NSURL URLWithString:[baseUrl stringByAppendingPathComponent:videoDict[@"image"]]];
    
    MyVideo *video = self.videos[indexPath.row];
    cell.textLabel.text = video.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"length:%zd, -04- id:%zd", video.length, video.ID];
    
    NSString *baseUrl = @"http://120.25.226.186:32812/";
    NSURL *imageUrl = [NSURL URLWithString:[baseUrl stringByAppendingPathComponent:video.image]];
    
    [cell.imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"default"]];
    
    // 3
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videos.count;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1
//    NSDictionary *videoDict = self.videos[indexPath.row];
//    
//    NSString *baseUrl = @"http://120.25.226.186:32812/";
//    
//    NSURL *mp4Url = [NSURL URLWithString:[baseUrl stringByAppendingPathComponent:videoDict[@"url"]]];
    
    
    MyVideo *video = self.videos[indexPath.row];
    
    NSString *baseUrl = @"http://120.25.226.186:32812/";
    
    NSURL *mp4Url = [NSURL URLWithString:[baseUrl stringByAppendingPathComponent:video.url]];
    
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:mp4Url];
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end


