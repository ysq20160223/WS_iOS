//
//  IconBtn.m
//  QQZone
//
//  Created by Apple on 2020/6/12.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "IconBtn.h"

// category
#import "UIView+X.h"

#import "Const.h"

@interface IconBtn ()

@property (nonatomic, assign) BOOL isLandscape;

@end


@implementation IconBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self setImage:[UIImage imageNamed:@"AppIcon"] forState:UIControlStateNormal];
        [self setTitle:@"YY" forState:UIControlStateNormal];
    }
    return self;
}


- (void)rotate:(BOOL)isLandscape {
    self.isLandscape = isLandscape;
//    NSLog(@"isLandscape: %d", isLandscape);
    
    self.xWidth = isLandscape ? kIconBtnIconLandscapeWH : kIconBtnIconPortraintWH;
    self.xHeight = isLandscape ? self.xWidth + kIconBtnTitleLandscapeH : kIconBtnIconPortraintWH;
    self.xY = isLandscape ? kDockPortraintW : kStatusBarH;
    self.xCenterX = self.superview.xCenterX;
    self.clipsToBounds = YES;
}


#pragma mark -
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (self.isLandscape) {
        return CGRectMake(0, 0, self.xWidth, self.xHeight - kIconBtnTitleLandscapeH);
    } else {
        return self.bounds;
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (self.isLandscape) {
        return CGRectMake(0, self.imageView.xHeight, self.xWidth, kIconBtnTitleLandscapeH);
    } else {
        return CGRectZero;
    }
}

@end
