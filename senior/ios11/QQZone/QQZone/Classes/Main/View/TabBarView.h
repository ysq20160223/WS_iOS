//
//  TabBarView.h
//  QQZone
//
//  Created by Apple on 2020/6/10.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Const.h"

NS_ASSUME_NONNULL_BEGIN

@class TabBarBtn;

#pragma mark -
typedef void(^ClickBlock)(TabBarBtn *btn, DockItemType fromType, DockItemType toType);


#pragma mark -
@interface TabBarView : UIView

@property (nonatomic, copy) ClickBlock clickBlock;

//
- (void)rotate:(BOOL)isLandscape;

//
- (void)unselectAllType;

//
- (void)clickItem:(TabBarBtn *)btn;

@end



@interface TabBarBtn : UIButton

@end

NS_ASSUME_NONNULL_END
