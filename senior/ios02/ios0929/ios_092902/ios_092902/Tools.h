//
//  Tools.h
//  ios_092902
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject <NSCopying, NSMutableCopying>

// 提供类方法
// 1, 表明身份, 说明这是一个单例
// 2, 方便外界调用
// 3, 注意点 : 类方法命名规范 : 一般以 share+类名|default+类名|

+ (instancetype)shareTools;

@end
