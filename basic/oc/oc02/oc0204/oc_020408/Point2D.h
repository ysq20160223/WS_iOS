//
//  Point2D.h
//  
//
//  Created by Apple on 2017/7/10.
//
//

#ifndef Point2D_h
#define Point2D_h

#import <Foundation/Foundation.h>

@interface Point2D : NSObject {
    double _x;
    double _y;
}

- (void)setX:(double)x;
- (double)x;

- (void)setY:(double)y;
- (double) y;

- (void)setX:(int)x andY:(int)y;

- (double)distanceWithOther:(Point2D *)other;

+ (double)distanceBetweenPointA:(Point2D *)a andPointB:(Point2D *)b;

@end

#endif /* Point2D_h */
