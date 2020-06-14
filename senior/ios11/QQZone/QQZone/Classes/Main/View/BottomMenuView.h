//
//  BottomMenuView.h
//  QQZone
//
//  Created by Apple on 2020/6/9.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BottomMenuView;


typedef enum {
    BottomMenuMood,
    BottomMenuPhoto,
    BottomMenuBlog
} BottomMenuType;



#pragma mark -
@protocol BottomMenuDelegate <NSObject>

@optional
- (void)bottomMenuView:(BottomMenuView *)bottomMenuView didClickBottomMenuType:(BottomMenuType)bottomMenuType;

@end



#pragma mark -
@interface BottomMenuView : UIView

// dategate
@property (nonatomic, strong) id<BottomMenuDelegate> bottomMenuDelegate;

//
- (void)rotate:(BOOL)isLandscape;


@end


NS_ASSUME_NONNULL_END
