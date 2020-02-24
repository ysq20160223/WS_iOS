//
//  UIView+Frame.h
//  ios_0921
//
//  Created by Apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
    1, 如果 @property 在声明类的时候使用, 会自动生成属性 (前面带下划线), 分类不能添加属性
    2, 如果 @property 在分类中使用, 不会生成成员属性, 只会生成 get, set 方法
 */
@interface UIView (Frame)

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

//
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

//- (CGFloat)width;
//
//- (CGFloat)height;


@end
