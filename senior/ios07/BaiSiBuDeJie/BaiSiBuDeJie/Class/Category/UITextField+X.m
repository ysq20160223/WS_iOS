//
//  UITextField+X.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/26.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UITextField+X.h"


@implementation UITextField (X)

- (void)setPlacehoderColor:(UIColor *)placehoderColor {
    // 提前设置占位文字; 目的: 提前创建placeholderLabel
    NSString *beforePlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = beforePlaceholder;
    
    // 恢复到默认的占位文字颜色
    if (nil == placehoderColor) {
        placehoderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    [self setValue:placehoderColor forKeyPath:@"placeholderLabel.textColor"];
}

- (UIColor *)placehoderColor {
    return [self valueForKeyPath:@"placeholderLabel.textColor"];
}

@end
