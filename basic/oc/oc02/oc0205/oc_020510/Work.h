//
//  Work.h
//  oc_020510
//
//  Created by sq y on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Work : NSObject

@property NSString *name;

/*
    自定义构造方法的规范
        1, 一定是对象方法, 一定是以 - 开头
        2, 返回值一定是 id 类型
        3, 方法名一般以 init 开头
 */
// 自定义构造方法
- (id)initWithName:(NSString *)name;


@end
