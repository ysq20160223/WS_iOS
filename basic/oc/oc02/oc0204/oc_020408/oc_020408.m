//
//  oc_020408.m
//  
//
//  Created by sq y on 2017/7/10.
//
//

#import <Foundation/Foundation.h>

#import "Point2D.h"
#import "Circle.h"

#import "../../../../../PreHeader.h"

// cc oc_020408.m Point2D.m Circle.m -framework Foundation

// ---
void fun_01() {
    Point2D *p1 = [Point2D new];
    [p1 setX:0 andY:0];
    
    Point2D *p2 = [Point2D new];
    [p2 setX:3 andY:4];
    
    double distanceWithOther = [p1 distanceWithOther:p2];
    NSLog(@"distanceWithOther: %f", distanceWithOther);
    
    double distanceBetween = [Point2D distanceBetweenPointA:p1 andPointB:p2];
    NSLog(@"distanceBetween: %f", distanceBetween);
}

void fun_02() {
    Circle *c1 = [Circle new];
    
    Point2D *p1 = [Point2D new];
    [p1 setX:5 andY:5];
    
    [c1 setPoint2D:p1]; // 设置圆心
    [c1 setRadius:3]; // 设置半径
    
    //
    Circle *c2 = [Circle new];
    
    Point2D *p2 = [Point2D new];
    [p2 setX:8 andY:9];
    
    [c2 setPoint2D:p2];
    [c2 setRadius:3];
    
    // c1 (5, 5) 1 -- c2 (8, 9) 1
    NSLog(@"isInteract: %d", [c1 isInteractWithOther:c2]);
    //    NSLog(@"isInteract : %d", [Circle isInteractBetweenCircleA:c1 andCircleB:c2]);
}

// ---
int main() {
    
    fun_01();
    
//    fun_02();
    
    return 0;
}



