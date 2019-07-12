//
//  Point2D.m
//  
//
//  Created by sq y on 2017/7/10.
//
//

#import <math.h>

#import "Point2D.h"

@implementation Point2D

- (void)setX:(double)x {
    _x = x;
}
- (double)x {
    return _x;
}

- (void)setY:(double)y {
    _y = y;
}
- (double)y {
    return _y;
}

- (void)setX:(int)x andY:(int)y {
    [self setX:x]; // 建议
    [self setY:y];
    
    //    self->_x = x; // 不建议
    //    self->_y = y;
    
    //    _x = x; // 不建议
    //    _y = y;
}

// 计算和另一个点之间的距离
- (double)distanceWithOther:(Point2D *)other {
    return [Point2D distanceBetweenPointA:self andPointB:other]; // 对象方法 调用 类方法
}

// 计算两个点之间的距离
+ (double)distanceBetweenPointA:(Point2D *)pointA andPointB:(Point2D *)pointB {
    double xDelta = [pointA x] - [pointB x];
    double xDeltaPow = pow(xDelta, 2); // 平分
    
    double yDelta = [pointA y] - [pointB y];
    double yDeltaPow = pow(yDelta, 2);
    
    return sqrt(xDeltaPow + yDeltaPow);
    //    return [a distanceWithOther:b]; // 类方法 调用 对象方法
}
@end



