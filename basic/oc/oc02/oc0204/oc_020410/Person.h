//
//  Person.h
//  oc_020410
//
//  Created by sq y on 2017/7/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}

- (void)setAge:(int)age;
- (int)age;

@end
