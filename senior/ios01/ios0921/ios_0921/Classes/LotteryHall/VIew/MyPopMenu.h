//
//  MyPopMenu.h
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyPopMenu;

//
@protocol MyPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidClickClose:(MyPopMenu *)popMenu;

@end

// -----
@interface MyPopMenu : UIView

@property (nonatomic, weak) id<MyPopMenuDelegate> delegate;

//

+ (instancetype)showInPoint:(CGPoint)point;

- (void)hideInPoint:(CGPoint)point completion:(void (^ __nullable)())completion;


@end
