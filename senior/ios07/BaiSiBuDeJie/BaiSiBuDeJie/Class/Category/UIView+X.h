//
//  UIView+X.h
//
//  Created by Apple on 2017/11/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (X)

@property (nonatomic, assign) CGFloat xWidth;
@property (nonatomic, assign) CGFloat xHeight;

@property (nonatomic, assign) CGFloat xX;
@property (nonatomic, assign) CGFloat xY;

@property (nonatomic, assign) CGFloat xCenterX;
@property (nonatomic, assign) CGFloat xCenterY;

@property (nonatomic, assign) CGFloat xRight;
@property (nonatomic, assign) CGFloat xBottom;

@property (nonatomic, assign) CGSize xSize;

+ (instancetype)xViewFromXib;

- (BOOL)intersectWithView:(UIView *)view;

@end


