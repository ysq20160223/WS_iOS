//
//  XPopMenu.h
//  ios_0921
//
//  Created by Apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XPopMenu;



@protocol XPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidClickClose:(XPopMenu *)popMenu;

@end



@interface XPopMenu : UIView

@property (nonatomic, weak) id<XPopMenuDelegate> delegate;

+ (instancetype)showInPoint:(CGPoint)point;

- (void)hideInPoint:(CGPoint)point completion:(void (^ __nullable)(void))completion;

@end
