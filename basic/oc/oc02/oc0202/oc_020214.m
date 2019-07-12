//
//  oc_020214.m
//  
//
//  Created by sq y on 2017/7/9.
//
//

/*
    01, 方法的声明和实现
        设计一个方法, 用来和其它车比较车速, 返回车速的差距
 
    02, 匿名对象 - 会造成内存泄漏
 
    03, ios 文档
        直接放到 xcode
            /Applications/Xcode.app/Contents/Developer/Documentation/DocSets
 
 */

#import <Foundation/Foundation.h>

#import "../../../../PreHeader.h"

// 1, 声明
@interface Car : NSObject
{
    @public
    int speed;
}
- (int)compareSpeedWithOther:(Car *)otherCar;
@end

// 2, 实现
@implementation Car
- (int)compareSpeedWithOther:(Car *)otherCar
{
    return speed - otherCar->speed;
}
@end

int main()
{
    Car *car = [Car new];
    car->speed = 300;
    
    Car *otherCar = [Car new];
    otherCar->speed = 120;
    
    int i = [car compareSpeedWithOther:otherCar];
    NSLog(@"i: %d", i);
    
    return 0;
}




