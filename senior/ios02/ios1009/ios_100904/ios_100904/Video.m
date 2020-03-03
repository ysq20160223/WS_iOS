//
//  Audio.m
//  ios_100904
//
//  Created by Apple on 2020/3/1.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "Video.h"

@implementation Video

+ (instancetype)videoWithDict:(NSDictionary *)dict {
    Video *video = [[Video alloc] init];

    // kvc: 服务端返回key为id; 模型中字段为ID
//    [video setValuesForKeysWithDictionary:dict];
    
    //
    video.ID = dict[@"id"];
    video.url = dict[@"url"];
    video.name = dict[@"name"];
    video.albumPic = dict[@"albumPic"];
    video.author = dict[@"author"];

    return video;
}

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}


- (NSString *)description {
    return [NSString stringWithFormat:@"Video = [ID: %@, url: %@, name: %@, author: %@, albumPic: %@]", self.ID, self.url, self.name, self.author, self.albumPic];
}

@end
