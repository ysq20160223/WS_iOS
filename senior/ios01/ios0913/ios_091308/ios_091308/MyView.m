//
//  MyView.m
//  ios_091308
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)setImage:(UIImage *)image {
    XLog
    _image = image;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    XLog
    [self.image drawInRect:rect];
}

- (instancetype)initWithImage:(UIImage *)image {
    if(self = [super init]) {
        NSLog(@"width: %f; height: %f", image.size.width, image.size.height);
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        _image = image;
    }
    return self;
}


@end


