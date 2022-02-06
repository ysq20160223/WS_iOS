//
//  Person.h
//  oc_0313
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Book.h"

@interface Person : NSObject

@property int age;

// retain : 生成 set 方法里面, release 旧值, retain 新值
@property (retain)Book *book;

@end


