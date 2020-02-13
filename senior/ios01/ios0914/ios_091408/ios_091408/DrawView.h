//
//  DrawView.h
//  ios_091408
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

//
- (void)clear;

- (void)undo;

- (void)erase;

- (void)setLineWidth:(CGFloat)width;

- (void)setLineColor:(UIColor *)color;

@end
