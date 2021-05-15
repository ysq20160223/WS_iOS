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

+ (instancetype)xItemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage tartget:(id)target action:(SEL)action;


//
+ (instancetype)xItemWithImage:(NSString *)image andHighlightImage:(NSString *)highlightImage andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize;

+ (instancetype)xItemWithTitle:(NSString *)title andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize;

+ (instancetype)xItemWithTitle:(NSString *)title andImage:(NSString *)image andHighlightImage:(NSString *)highlightImage andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize;

+ (instancetype)xItemWithTitle:(NSString *)title andImage:(NSString *)image andHighlightImage:(NSString *)highlightImage andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize andIsBold:(BOOL)isBold ;

@end

NS_ASSUME_NONNULL_END
