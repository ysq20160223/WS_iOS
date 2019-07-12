//
//  Person.m
//  oc_0301
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Person.h"

#import "../../../../../PreHeader.h"

@implementation Person

+ (void)load {

}

// 当一个 Person 对象被回收时, 就会自动调用这个方法
- (void)dealloc {
    NSLog(@"");
    [super dealloc]; // 一定要调用, 而且放在最后面
}


@end

