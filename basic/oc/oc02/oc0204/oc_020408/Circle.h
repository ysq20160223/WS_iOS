//
//  Circle.h
//  
//
//  Created by sq y on 2017/7/10.
//
//

#ifndef Circle_h
#define Circle_h

#import <Foundation/Foundation.h>

#import "Point2D.h"

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

#endif /* Circle_h */
