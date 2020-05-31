//
//  LrcLabel.m
//  Media
//
//  Created by Apple on 2020/5/25.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LrcLabel.h"
#import "MediaConst.h"

@implementation LrcLabel

- (void)setCurProgress:(CGFloat)curProgress {
    _curProgress = curProgress;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGRect fillRect = CGRectMake(0, 0, self.bounds.size.width * self.curProgress, self.bounds.size.height);
    
//    [[UIColor redColor] set];
    [MainColor set];
    
//    UIRectFill(fillRect);
    UIRectFillUsingBlendMode(fillRect, kCGBlendModeSourceIn);
}

@end
