//
//  VCView.m
//  ios_091309
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VCView.h"


@interface VCView ()

@property (nonatomic, strong) UIImage *image;

@end




@implementation VCView

static int _y;
static int _x;

static int _imageW;
static int _imageH;

static int _vertical; /// 向下为1, 向上为0
static int _horizontal; /// 向右为1, 向左为0

static int _tag; /// 上下左右方向改变

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    self.image = [UIImage imageNamed:@"ab9.png"];
    _imageW = self.image.size.width;
    _imageH = self.image.size.height;
    _x = 0;
    _y = 0;
    
    _vertical = 1;
    _horizontal = 1;
    
    _tag = 0;
    
    // 每次屏幕刷新就会调用, 每秒刷新60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:NSRunLoop.mainRunLoop forMode:NSDefaultRunLoopMode];
    
}

- (void)update {
    NSLog(@"_x: %d; _y: %d", _x, _y);
    
    static int step = 2;
  
    if (_vertical) {
        _x = _x + step;
    } else {
        _x = _x - step;
    }
    if (_horizontal) {
        _y = _y + step;
    } else {
        _y = _y - step;
    }
   
    
    if (_x >= self.bounds.size.width - _imageW) {
        _vertical = 0;
        [self reverseImage];
    } else if (_x <= 0) {
        _vertical = 1;
        [self reverseImage];
    }
    if (_y >= self.bounds.size.height - _imageH) {
        _horizontal = 0;
        [self reverseImage];
    } else if (_y <= 0) {
        _horizontal = 1;
        [self reverseImage];
    }
    
    // 会调用 drawRect, 并不是立即调用, 仅仅设置了标志, 当下一次屏幕刷新的时候调用
    [self setNeedsDisplay];
}

- (void)reverseImage {
    _tag = !_tag;
    if (_tag) {
        self.image = [UIImage imageNamed:@"abx.png"];
    } else {
        self.image = [UIImage imageNamed:@"ab9.png"];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.image drawAtPoint:CGPointMake(_x, _y)];
}


@end


