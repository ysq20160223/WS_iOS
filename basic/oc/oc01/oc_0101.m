//
//  oc_0101.m
//  
//
//  Created by sq y on 2017/7/7.
//
//

/*
    01, #import
        和 #include 一样, 复制文件的内容
        可以自动防止文件的内容被重复复制
 
    02, 显示Fundation 框架头文件路径 
            /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks
 
    03, 编译链接
        cc 文件名.m -framework Foundation
 
 */


#import <Foundation/Foundation.h>

#import "../../../PreHeader.h"


int main()
{
    NSLog(@"oc program");
    
    return 0;
}



