//
//  DrawView.m
//  ios_091408
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DrawView.h"
#import "MyUIBezierPath.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, strong) NSMutableArray *pathArray; // 路径集合

@property (nonatomic, assign) CGFloat width; // 线的宽度
@property (nonatomic, strong) UIColor *color; // 线的颜色

@end



@implementation DrawView

- (void)clear {
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}

- (void)undo {
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}

- (void)erase {
    [self setLineColor:UIColor.whiteColor];
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)width {
    self.width = width;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)color {
    self.color = color;
    [self setNeedsDisplay];
}

//
- (NSMutableArray *)pathArray {
    if (!_pathArray) {
        _pathArray = NSMutableArray.array;
    }
    return _pathArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [UIPanGestureRecognizer.alloc initWithTarget:self action:@selector(pan:)];
    self.width = 1; // 默认宽度
    self.color = UIColor.blackColor; // 默认颜色
    [self addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint curP = [pan locationInView:self];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        MyUIBezierPath *path = MyUIBezierPath.alloc.init;
        self.path = path;
        
        [path setLineWidth:self.width]; // 设置线的宽度
        path.color = self.color; // 设置线的颜色
        
        [self.pathArray addObject:path];
        [path moveToPoint:curP];
        [path setLineJoinStyle:kCGLineJoinRound];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:curP];
        [self setNeedsDisplay];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    for (MyUIBezierPath *path in self.pathArray) {
        [path.color set];
        [path stroke];
    }
//    [self.path stroke];
    
}

@end


