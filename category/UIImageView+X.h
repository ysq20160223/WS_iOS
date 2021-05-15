//
//  UIImageView+X.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/7.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImage+X.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (X)

- (void)xCircle:(NSString *)url placeholder:(NSString *)placeholder;

- (void)xRect:(NSString *)url placeholder:(NSString *)placeholder;

- (UIImage *)drawVerticalLineOfDashByImageView;

- (UIImage *)drawHorizontalLineOfDashByImageView;

@end

NS_ASSUME_NONNULL_END
