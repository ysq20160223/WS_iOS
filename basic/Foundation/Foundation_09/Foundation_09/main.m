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


#define PATH @"/Users/Apple/Desktop/iOS"


long codeLineCount(NSString *path) {
    
    NSFileManager *mgr = [NSFileManager defaultManager]; // 1, 获得文件管理者 - 单例模式
    
    // 2, 判断 path 是文件夹还是文件
    BOOL dir = NO; // 标记是否为文件夹
    BOOL exist = [mgr fileExistsAtPath:path isDirectory:&dir];
    
    // 3, 文件夹不存在
    if(!exist) {
        return 0;
    }
    
    // 4, 路径存在
    if (dir) {
        NSArray *array = [mgr contentsOfDirectoryAtPath:path error:nil];
        
        int totalCount = 0;
        
        for (NSString  *fileName in array) {
            NSString *fullName = [NSString stringWithFormat:@"%@/%@", path, fileName];
            
            NSLog(@"%@", path);
            
            totalCount += codeLineCount(fullName);
        }
        return totalCount;
        
    } else {
        // 判断文件拓展名
        NSString *extension = [[path pathExtension] lowercaseString];
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
        NSString *str = [path stringByReplacingCharactersInRange:range withString:@""];
        NSLog(@"\t\t%@, line: %ld", str, array.count);
        
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


