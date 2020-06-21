//
//  UIView+Extend.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2017/11/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIView+X.h"

@implementation UIView (X)

// ----- get
- (CGFloat)xWidth {
    return self.frame.size.width;
}

- (CGFloat)xHeight {
    return self.frame.size.height;
}

//
- (CGFloat)xX {
    return self.frame.origin.x;
}

- (CGFloat)xY {
    return self.frame.origin.y;
}

//
- (CGFloat)xCenterX {
    return self.center.x;
}

- (CGFloat)xCenterY {
    return self.center.y;
}

//
- (CGFloat)xRight {
//    return self.bsX + self.bsWidth;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)xBottom {
//    return self.bsY + self.bsHeight;
    return CGRectGetMaxY(self.frame);
}

//
- (CGSize)xSize {
    return self.frame.size;
}

// ------ set
- (void)setXWidth:(CGFloat)xWidth {
    CGRect frame = self.frame;
    frame.size.width = xWidth;
    self.frame = frame;
}

- (void)setXHeight:(CGFloat)bsHeight {
    CGRect frame = self.frame;
    frame.size.height = bsHeight;
    self.frame = frame;
}

//
- (void)setXX:(CGFloat)xX {
    CGRect frame = self.frame;
    frame.origin.x = xX;
    self.frame = frame;
}

- (void)setXY:(CGFloat)bsY {
    CGRect frame = self.frame;
    frame.origin.y = bsY;
    self.frame = frame;
}

//
- (void)setXCenterX:(CGFloat)bsCenterX {
    CGPoint center = self.center;
    center.x = bsCenterX;
    self.center = center;
}

- (void)setXCenterY:(CGFloat)bsCenterY {
    CGPoint center = self.center;
    center.y = bsCenterY;
    self.center = center;
}

- (void)setXRight:(CGFloat)bsRight{
    self.xX = bsRight - self.xWidth;
}

- (void)setXBottom:(CGFloat)bsBottom {
    self.xY = bsBottom - self.xHeight;
}

//
- (void)setXSize:(CGSize)bsSize {
    CGRect frame = self.frame;
    frame.size = bsSize;
    self.frame = frame;
}

//
+ (instancetype)xViewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

//
- (BOOL)intersectWithView:(UIView *)view {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    
    return CGRectIntersectsRect(selfRect, viewRect);
}

@end


