//
//  main.m
//  Foundation_09
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 01, 计算文件行数
 */

#import <Foundation/Foundation.h>
#import "../../../../PreHeader.h"


#define PATH @"/Users/Apple/Desktop/iOS/WS_iOS/foundation_part_src/"


long codeLineCount(NSString *path) {
    
    NSFileManager *mgr = [NSFileManager defaultManager]; // 1, 获得文件管理者 - 单例模式
    
    // 2, 判断 path 是文件夹还是文件
    BOOL isDir = NO; // 标记是否为文件夹
    BOOL isExist = [mgr fileExistsAtPath:path isDirectory:&isDir];
    
    // 3, 文件夹不存在
    if(!isExist) {
        return 0;
    }
    
    // 4, 路径存在
    if (isDir) { // 文件夹
        NSArray *array = [mgr contentsOfDirectoryAtPath:path error:nil];
        
        int totalLineCount = 0;
        for (NSString *fileName in array) {
            NSString *fullPath = [NSString stringWithFormat:@"%@%@", path, fileName];
            
            NSLog(@"fullPath: %@, path: %@", fullPath, path);
            totalLineCount += codeLineCount(fullPath);
        }
        return totalLineCount;
    } else { // 文件
        NSString *extension = [[path pathExtension] lowercaseString]; // 判断文件拓展名
        if(!([extension isEqualToString:@"h"] || [extension isEqualToString:@"m"] || [extension isEqualToString:@"c"])) {
            return 0;
        }
        
        // 加载文件内容
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSArray *array = [content componentsSeparatedByString:@"\n"];
        
        //    for (NSString *line in array) {
        //        NSLog(@"%@", line);
        //    }
        
        //        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //            NSLog(@"%ld - %@", idx, obj);
        //        }];
        
        // 过滤前面的路径名
        NSRange range = [path rangeOfString:PATH];
        NSString *fileName = [path stringByReplacingCharactersInRange:range withString:@""];
        NSLog(@"\t\tfileName: %@, line: %ld", fileName, array.count);
        
        return array.count;
    }
    
}

int main() {
    @autoreleasepool {
        long count = codeLineCount(PATH);
        
        NSLog(@"count: %ld", count);
    }
    return 0;
}


