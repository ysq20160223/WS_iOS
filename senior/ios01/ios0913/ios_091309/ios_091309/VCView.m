//
//  VCView.m
//  ios_091309
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VCView.h"

@implementation VCView

static int _snowY;

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)update {
    NSLog(@"");
    
    _snowY += 5;
    
    if (_snowY > self.bounds.size.height) {
        _snowY = 0;
    }
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *image = [UIImage imageNamed:@"ab9.png"];
    [image drawAtPoint:CGPointMake(0, _snowY)];
}


@end


