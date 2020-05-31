//
//  LrcTool.m
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LrcTool.h"

#import "LrcLineModel.h"

@implementation LrcTool

+ (NSArray<LrcLineModel *> *)lrcToolWithLrcName:(NSString *)lrcName {
    // 1.获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:lrcName ofType:nil];
//    NSLog(@"%@", path);
    
    // 2.获取歌词
    NSString *lrcString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
//    NSLog(@"%@", lrcString);
    
    // 3.转化成歌词数组
    NSArray *lrcArray = [lrcString componentsSeparatedByString:@"\n"];
//    NSLog(@"count: %ld", lrcArray.count);
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSString *lrcLineString in lrcArray) {
//        NSLog(@"%@", lrcLineString);
        
        
        /*
         [ti:简单爱]
         [ar:周杰伦]
         [al:范特西]
         */
        // 4.过滤不需要的字符串
        if ([lrcLineString hasPrefix:@"[ti:"]
            || [lrcLineString hasPrefix:@"[ar:"]
            || [lrcLineString hasPrefix:@"[al:"]
            || [lrcLineString hasPrefix:@"[by:"]
            || [lrcLineString hasPrefix:@"[sign:"]
            || [lrcLineString hasPrefix:@"[total:"]
            || [lrcLineString hasPrefix:@"[offset:"]
            || ![lrcLineString hasPrefix:@"["]
            ) {
//            NSLog(@"%@; %d; %d; %d; %d; %d; %d; %d; %d", lrcLineString, [lrcLineString hasPrefix:@"[ti:"], [lrcLineString hasPrefix:@"[ar:"], [lrcLineString hasPrefix:@"[al:"], [lrcLineString hasPrefix:@"[by:"], [lrcLineString hasPrefix:@"[sign:"], [lrcLineString hasPrefix:@"[total:"], [lrcLineString hasPrefix:@"[offset:"], [lrcLineString hasPrefix:@"["]);
            continue;
        }
        
//        NSLog(@"%@", lrcLineString);
        
        // 5.将歌词转化成模型
        LrcLineModel *lrcLineModel = [LrcLineModel lrcLineString:lrcLineString];
        [tempArray addObject:lrcLineModel];
    }
//    NSLog(@"count: %ld", tempArray.count);
    return tempArray;
}

@end
