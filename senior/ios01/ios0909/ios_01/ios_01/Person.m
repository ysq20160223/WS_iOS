//
//  Person.m
//  ios01
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

@implementation Person

// 解档一个文件的时候调用
// 需要解档的属性
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super init]) {
        // 给成员属性赋值
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

// 模型中的属性需要归档
// 把一个自定义的对象归档的时候调用
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
}


- (NSString *)description {
    return [NSString stringWithFormat:@"Person[name: %@, age: %d]", _name, _age];
}


@end



