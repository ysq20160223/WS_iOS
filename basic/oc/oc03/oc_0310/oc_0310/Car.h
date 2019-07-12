//
//  Car.h
//  oc_0310
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

@interface Car : NSObject
{
    int _speed;
}

- (void)setSpeed:(int)speed;
- (int)speed;

@end
