//
//  ViewController.m
//  ios_100906_02
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+WebCache.h"

#import "MJExtension.h"

#import "GDataXMLNode.h"

#import "MyVideo.h"

#import <MediaPlayer/MediaPlayer.h>


@interface ViewController () <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray *videos;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [MyVideo setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
    
    // 1,
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video?type=XML"];
    
    // 2
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // 3
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //        NSLog(@"data=%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        // 4 解析数据
        // 4.1 加载整个 xml 文档
        GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:kNilOptions error:nil];
        
        // 4.2
        NSArray *elements = [doc.rootElement elementsForName:@"video"];
        for (GDataXMLElement *element in elements) {
//            NSLog(@"%@", element);
            MyVideo *video = [[MyVideo alloc] init];
            
            video.name = [element attributeForName:@"name"].stringValue;
            video.length = [element attributeForName:@"length"].stringValue.integerValue;
            video.image = [element attributeForName:@"image"].stringValue;
            video.url = [element attributeForName:@"url"].stringValue;
            
            [self.videos addObject:video];
        }
        
        // 5
        [self.tableView reloadData];
        
    }];
    
}


#pragma mark data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videos.count;
}


// data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"video";
    
    // 1
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2
    MyVideo *video = self.videos[indexPath.row];
    cell.textLabel.text = video.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"length:%zd, -0602- id:%zd", video.length, video.ID];
    
    NSString *baseUrl = @"http://120.25.226.186:32812/";
    NSURL *imageUrl = [NSURL URLWithString:[baseUrl stringByAppendingPathComponent:video.image]];
    
    [cell.imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"default"]];
    
    // 3
    return cell;
    
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1
    MyVideo *video = self.videos[indexPath.row];
    
    NSString *baseUrl = @"http://120.25.226.186:32812/";
    
    NSURL *mp4Url = [NSURL URLWithString:[baseUrl stringByAppendingPathComponent:video.url]];
    
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:mp4Url];
    [self presentViewController:vc animated:YES completion:nil];
    
}

// -- 延时加载
- (NSMutableArray *)videos {
    if (nil == _videos) {
        _videos = [NSMutableArray array];
    }
    return _videos;
}

@end


