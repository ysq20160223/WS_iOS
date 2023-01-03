//
//  RedView.m
//  ios_091306
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RedView.h"

@implementation RedView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self drawText];
    
    UIImage *image = [UIImage imageNamed:@"a_60"];
    
    [image drawAtPoint:CGPointZero]; // 绘制的图片保持原来的图片
//    [image drawInRect:rect]; // 把图片填充到这个 rect 中
    
//    UIRectClip(CGRectMake(0, 0, 100, 100)); // 裁剪区域
    
    [image drawAsPatternInRect:rect]; // 平铺
    
    
    
    // 快速绘制图形
//    [[UIColor magentaColor] set];
//    UIRectFill(CGRectMake(0, 0, 100, 100));
    
    [self drawText];
    
}


- (void)drawText {
    NSString *str = @"abcdefg";
    
    NSMutableDictionary *dict = NSMutableDictionary.dictionary;
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:150];
    dict[NSForegroundColorAttributeName] = UIColor.cyanColor;
    dict[NSStrokeWidthAttributeName] = @3;
    dict[NSStrokeColorAttributeName] = UIColor.blueColor;
    
    NSShadow  *shadow = NSShadow.alloc.init;
    shadow.shadowOffset = CGSizeMake(21, 21);
    shadow.shadowColor = UIColor.yellowColor;
    shadow.shadowBlurRadius = 1;
    dict[NSShadowAttributeName] = shadow;
    
    //    [str drawAtPoint:CGPointZero withAttributes:dict]; ／／ 不会自动换行
    
    [str drawInRect:self.bounds withAttributes:dict]; // 会自动换行
}

@end


