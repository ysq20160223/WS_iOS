//
//  UIBarButtonItem+X.m
//
//  Created by Apple on 2020/3/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UIBarButtonItem+X.h"
//#import "Config.h"


@implementation UIBarButtonItem (X)

+ (instancetype)xItemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage tartget:(id)target action:(SEL)action {
    UIButton *btn = UIButton.alloc.init;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}


//
+ (instancetype)xItemWithImage:(NSString *)image andHighlightImage:(NSString *)highlightImage andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize {
    return [self xItemWithTitle:@"" andImage:image andHighlightImage:highlightImage andTartget:target andAction:action andHeight:height andFontOfSize:fontSize andIsBold:NO andTextColor:[UIColor colorWithRed:0x33 / 255.0 green:0x33 / 255.0 blue:0x33 / 255.0 alpha:1]];
}

+ (instancetype)xItemWithTitle:(NSString *)title andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize {
    return [self xItemWithTitle:title andImage:@"" andHighlightImage:@"" andTartget:target andAction:action andHeight:height andFontOfSize:fontSize andIsBold:NO andTextColor:[UIColor colorWithRed:0x33 / 255.0 green:0x33 / 255.0 blue:0x33 / 255.0 alpha:1]];
}

+ (instancetype)xItemWithTitle:(NSString *)title andImage:(NSString *)image andHighlightImage:(NSString *)highlightImage andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize andTextColor:(UIColor *)normalTextColor {
    return [self xItemWithTitle:title andImage:image andHighlightImage:highlightImage andTartget:target andAction:action andHeight:height andFontOfSize:fontSize andIsBold:NO andTextColor:normalTextColor];
}

+ (instancetype)xItemWithTitle:(NSString *)title andImage:(NSString *)image andHighlightImage:(NSString *)highlightImage andTartget:(id)target andAction:(SEL)action andHeight:(NSInteger)height andFontOfSize:(CGFloat)fontSize andIsBold:(BOOL)isBold andTextColor:(UIColor *)normalTextColor {
    
    UIButton *btn = UIButton.alloc.init;
//    btn.backgroundColor = UIColor.cyanColor;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:normalTextColor forState:UIControlStateNormal];
    if (isBold) {
        btn.font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        btn.font = [UIFont systemFontOfSize:fontSize];
    }
    
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    [btn sizeToFit];
    
    CGRect btnFrame = btn.frame;
    btnFrame.size.width += 10;
    btnFrame.size.height = height;
    btn.frame = btnFrame;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [UIBarButtonItem.alloc initWithCustomView:btn];;
}

@end
