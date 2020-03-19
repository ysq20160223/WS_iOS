//
//  UIBarButtonItem+X.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (X)

+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage tartget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
