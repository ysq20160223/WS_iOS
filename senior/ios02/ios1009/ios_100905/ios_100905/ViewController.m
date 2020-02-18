//
//  ViewController.m
//  ios_100905
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    一个元素包括了开始标签和结束标签
        拥有内容(属性)的标签 : <video>hh</video>
        没有内容(属性)的元素 : <video></video>
        没有内容的元素简写 : <video/>
 
    规范的 xml 文档最多只有一个根元素, 其它元素都是根元素的子元素
 
    //
    一个元素可以拥有多个属性
    属性值也可以用子元素来表示
    
    //
    解析方式
        DOM : 一次性将整个 xml 文档加载进内存, 比较适合解析小文件
        SAX : 从根元素开始, 按顺序一个元素一个元素往下解析, 比较适合解析大文件
 
 
 */

#import "ViewController.h"

#import "UIImageView+WebCache.h"

#import "MJExtension.h"

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
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data]; // 4.1
        
        parser.delegate = self; // 4.2
        
        [parser parse];
        
        [self.tableView reloadData];
        
    }];
    
}

#pragma mark NSXMLParserDelegate
// 1, 开始解析
- (void)parserDidStartDocument:(NSXMLParser *)parser {
//    NSLog(@"Start Document");
    
    
}

// 2, 解析每一个元素
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
//    NSLog(@"Start Element");
    
//    NSLog(@"elementName:%@, attributeDict:%@", elementName, attributeDict);
    if (attributeDict == nil || attributeDict.count == 0) {
        return;
    }
    
    [MyVideo objectWithKeyValues:attributeDict];
    
    // method 1
//    [self.videos addObject:[MyVideo objectWithKeyValues:attributeDict]];
    
    // method 2
    MyVideo *video = [[MyVideo alloc] init];
    video.keyValues = attributeDict;
    [self.videos addObject:video];
    
}

// 3, 解析每一个元素结束
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
//    NSLog(@"End Element");
    
    
}

// 4, 解析文档结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
//    NSLog(@"End Document");
    
    
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
    cell.detailTextLabel.text = [NSString stringWithFormat:@"length:%zd, -05- id:%zd", video.length, video.ID];
    
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


