//
//  Const.h
//  QQZone
//
//  Created by Apple on 2020/6/6.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define MainColor XColor(212, 47, 70)
#define CommonBgColor XColor(39, 39, 39)

#define kTitleViewH 44

// Dock
extern const CGFloat kDockLandscapeW;
extern const CGFloat kDockPortraintW;


// BottomMenuView
extern const CGFloat kBottomMenuViewLandscapeH;
extern const CGFloat kBottomMenuViewPortraintH;


// TabBarView
extern const CGFloat kTabBarViewItemWH;


// IconBtn
extern const CGFloat kIconBtnIconPortraintWH;
extern const CGFloat kIconBtnIconLandscapeWH;

extern const CGFloat kIconBtnTitleLandscapeH;



typedef enum {
    TypeIconBtn,
    
    TabBarMoments,
    TabBarPassive,
    TabBarPic,
    TabBarEAlbum,
    TabBarFriend,
    TabBarMore,
    
} DockItemType;


NS_ASSUME_NONNULL_END


