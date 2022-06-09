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
//#import "../../../../PrefixHeader.pch"


#define ROOT_PATH @"/Users/Apple/Desktop/github/WS_iOS/"
//#define PATH ROOT_PATH@"foundation_part_src"
//#define PATH ROOT_PATH@"basic"
//#define PATH ROOT_PATH@"basic/c"
//#define PATH ROOT_PATH@"basic/c/c01"
#define PATH ROOT_PATH@"basic/Foundation"
//#define PATH ROOT_PATH@"advanced"
//#define PATH ROOT_PATH@"senior"
//#define PATH ROOT_PATH@""

static int count = 0;

static NSString *printTab(int num) {
    NSString *s = @"";
    for (int i = 0; i < num; i++) {
        s = [s stringByAppendingString:@"-"];
    }
    return s;
}

long lineCount(NSString *path, int count) {
    // 1, 获得文件管理者 - 单例模式
    NSFileManager *nsFileManager = [NSFileManager defaultManager];
    
    // 2, 判断 path 是文件夹还是文件
    BOOL isDir = NO; // 标记是否为文件夹
    BOOL isExist = [nsFileManager fileExistsAtPath:path isDirectory:&isDir];
    
    // 3, 文件夹不存在
    if(!isExist) {
        NSLog(@"%@ is not exist", path);
        return 0;
    }
    

    // 4, 路径存在
    if (isDir) {
        // 文件夹
        NSArray *array = [nsFileManager contentsOfDirectoryAtPath:path error:nil];
        NSString *dirPath = [path substringFromIndex:ROOT_PATH.length];
        if (![dirPath containsString:@".xcodeproj"] && ![dirPath containsString:@".xcdatamodeld"] && ![dirPath containsString:@".git"] && ![dirPath containsString:@".xcassets"]) {
//            NSLog(@"dir: %@; count: %ld", dirPath, array.count);
            NSLog(@"dir: %@", dirPath);
        }
        
        count++;
        int totalLineCount = 0;
        for (NSString *fileName in array) {
//            NSLog(@"%@", fileName);
            
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, fileName];
//            NSLog(@"fullPath: %@", fullPath);
            totalLineCount += lineCount(fullPath, count);
        }
        return totalLineCount;
    } else {
        // 文件
        NSString *extension = [path.pathExtension lowercaseString]; // 判断文件拓展名
        if(!([extension isEqualToString:@"h"] || [extension isEqualToString:@"m"]
             || [extension isEqualToString:@"c"])) {
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
        NSRange range = [path rangeOfString:[NSString stringWithFormat:@"%@/", PATH]];
        NSString *file = [path stringByReplacingCharactersInRange:range withString:@""];
        NSLog(@"%@%@; %ld", printTab(count), file, array.count);
        
        return array.count;
    }
}


int main() {
    @autoreleasepool {
        NSLog(@"totalLineCount: %ld", lineCount(PATH, count));
    }
    return 0;
}


