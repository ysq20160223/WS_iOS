//
//  UIBarButtonItem+X.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UIBarButtonItem+X.h"


@implementation UIBarButtonItem (X)

+ (instancetype)xItemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage tartget:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}

@end
