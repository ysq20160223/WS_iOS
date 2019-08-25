//
//  MyView.m
//  ios01
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyView.h"

@implementation MyView

// 系统调用控件这个方法来解析 xib, storyboard
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        NSLog(@"");
    }
    return self;
}


@end



