//
//  LockView.m
//  ios_091405
//
//  Created by Apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LockView.h"

@interface LockView ()

@property (nonatomic, strong) NSMutableArray *selectBtn; // 选中的按钮

@property (nonatomic, assign) CGPoint curP; // 手指当前的点

@end



@implementation LockView

- (NSMutableArray *)selectBtn {
    if(_selectBtn == nil) {
        _selectBtn = [NSMutableArray array];
    }
    return _selectBtn;
}

// 离开屏幕
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 取消选中按钮选中状态
    NSMutableString *string = [NSMutableString string];
    for (UIButton *btn in self.selectBtn) {
        [string appendFormat:@"%d", (int)btn.tag];
        btn.selected = NO;
    }
    
    NSLog(@"%@", string);
    
    // 清空路径
    [self.selectBtn removeAllObjects];
    [self setNeedsDisplay];
}

// 开始移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint curP = [self getCurrentPoint:touches];
    self.curP = curP; //
    //
    UIButton *btn = [self btnRectContainsPoint:curP];
    if (btn && btn.selected == NO) {
        [btn setSelected:YES];
        [self.selectBtn addObject:btn]; // 添加按钮到集合
    }
    [self setNeedsDisplay];
}

// 开始点击
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint curP = [self getCurrentPoint:touches];
    
    //
    UIButton *btn = [self btnRectContainsPoint:curP];
    if (btn) {
        [btn setSelected:YES];
        [self.selectBtn addObject:btn]; // 添加按钮到集合
    }
}


// 获取当前手指所在的点
- (CGPoint)getCurrentPoint:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}

// 判断当前手指在不在按钮上
- (UIButton *)btnRectContainsPoint:(CGPoint)point {
    for (UIButton *btn in self.subviews) {
        // 判断当前手指在不在按钮上, 判断一个点在不在某个区域当中
        if(CGRectContainsPoint(btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}

// -----------------------

// 添加按钮
- (void)setUp {
    for (int i = 0; i < 9; i++) {
        // 创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i; // 绑定
        
        btn.userInteractionEnabled = NO;
        btn.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:0.3];
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        [self addSubview:btn];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    int column = 3;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat btnWH = 74;
    
    CGFloat margin = (self.bounds.size.width - btnWH * column) / (column + 1);
    
    for (int i = 0; i < self.subviews.count; i++) {
        int curCloumn = i % column;
        int curRow = i / column;
        
        x = margin + curCloumn * (btnWH + margin);
        y = margin + curRow * (btnWH + margin);
        
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
    }
}


//
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp]; // 添加按钮
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp]; // 添加按钮
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.selectBtn.count <= 0) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.selectBtn.count; i++) {
        UIButton * btn = self.selectBtn[i];
        if (i == 0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    
    //
    [path addLineToPoint:self.curP];
    [path setLineJoinStyle:kCGLineJoinRound]; // 圆角
    
    //
    [[UIColor cyanColor] set];
    [path setLineWidth:9];
    [path stroke];
    
}


@end


