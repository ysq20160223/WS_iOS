//
//  Circle.m
//  
//
//  Created by Apple on 2017/7/10.
//
//

#import "Circle.h"

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
+ (BOOL)isInteractBetweenCircleA:(Circle *)circleA andCircleB:(Circle *)circleB {
    return [circleA isInteractWithOther:circleB];
}

@end


