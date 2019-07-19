//
//  oc_020403.m
//
//
//  Created by sq y on 2017/7/9.
//
//

#import <Foundation/Foundation.h>
#import <math.h>

#import "../../../../PreHeader.h"


/*
 用来表示二维平面中某个点
 对象方法同时设置 X 和 Y
 对象方法计算跟其它点的距离
 类方法计算两个点之间的距离
 */

@interface Point2D : NSObject {
    double _x;
    double _y;
}

- (void)setX:(double)x;
- (double)x;

- (void)setY:(double)y;
- (double)y;

- (void)setX:(int)x andY:(int)y;

- (double)distanceWithOther:(Point2D *)other;

+ (double)distanceBetweenPointA:(Point2D *)a andPointB:(Point2D *)b;

@end


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



// ***********************************
@interface Circle : NSObject {
    double _radius;
    Point2D *_point2D;
}

- (void)setRadius:(double)radius;
- (double)radius;

- (void)setPoint2D:(Point2D *)point2D;
- (Point2D *)point2D;

- (BOOL)isInteractWithOther:(Circle *)circle;

+ (BOOL)isInteractBetweenCircleA:(Circle *)circleA andCircleB:(Circle *)circleB;

@end


@implementation Circle

- (void)setRadius:(double)radius {
    _radius = radius;
}
- (double)radius {
    return _radius;
}

- (void)setPoint2D:(Point2D *)point2D {
    _point2D = point2D;
}
- (Point2D *)point2D {
    return _point2D;
}

// 是否和其它圆有交集
- (BOOL)isInteractWithOther:(Circle *)circle {
    Point2D *p1 = [self point2D];
    Point2D *p2 = [circle point2D];
    
    double distance = [p1 distanceWithOther:p2];
    
    double radiusSum = [self radius] + [circle radius];
    
    return distance < radiusSum; // YES 相交 ／ NO : 不相交
}

// 两个圆是否有交集
+ (BOOL)isInteractBetweenCircleA:(Circle *)cA andCircleB:(Circle *)cB {
    return [cA isInteractWithOther:cB];
}

@end


// ***********************************
void fun_01() {
    Point2D *p1 = [Point2D new];
    [p1 setX:0 andY:0];
    
    Point2D *p2 = [Point2D new];
    [p2 setX:3 andY:4];
    
    NSLog(@"distanceWithOther: %f", [p1 distanceWithOther:p2]);
    
    NSLog(@"distanceBetween: %f", [Point2D distanceBetweenPointA:p1 andPointB:p2]);
}

void fun_02() {
    Circle *c1 = [Circle new];
    
    Point2D *p1 = [Point2D new];
    [p1 setX:5 andY:5];
    
    [c1 setPoint2D:p1]; // 设置圆心
    [c1 setRadius:1]; // 设置半径
    
    //
    Circle *c2 = [Circle new];
    
    Point2D *p2 = [Point2D new];
    [p2 setX:8 andY:9];
    
    [c2 setPoint2D:p2];
    [c2 setRadius:1];
    
    // c1 (5, 5) 1 -- c2 (8, 9) 1
    NSLog(@"isInteract : %d", [c1 isInteractWithOther:c2]);
    //    NSLog(@"isInteract : %d", [Circle isInteractBetweenCircleA:c1 andCircleB:c2]);
}


// ***********************************
int main() {
    
    //    fun_01();
    
    fun_02();
    
    return 0;
}





