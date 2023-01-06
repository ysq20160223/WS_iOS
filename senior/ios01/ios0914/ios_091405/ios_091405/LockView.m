//
//  LockView.m
//  ios_091405
//
//  Created by Apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LockView.h"

@interface LockView ()

@property (nonatomic, strong) NSMutableArray *selectBtnArray; // 选中的按钮

@property (nonatomic, assign) CGPoint curP; // 手指当前的点

@end



@implementation LockView

- (NSMutableArray *)selectBtnArray {
    if(!_selectBtnArray) {
        _selectBtnArray = NSMutableArray.array;
    }
    return _selectBtnArray;
}


#pragma mark - touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint curP = [self locationInView:touches];
  
    UIButton *btn = [self rectContainsPoint:curP];
    if (btn) {
        [btn setSelected:YES];
        [self.selectBtnArray addObject:btn]; // 添加按钮到集合
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint curP = [self locationInView:touches];
    self.curP = curP;
    
    UIButton *btn = [self rectContainsPoint:curP];
    if (btn && btn.selected == NO) {
        [btn setSelected:YES];
        [self.selectBtnArray addObject:btn]; // 添加按钮到集合
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 取消选中按钮选中状态
    NSMutableString *string = NSMutableString.string;
    for (UIButton *btn in self.selectBtnArray) {
        [string appendFormat:@"%d", (int)btn.tag];
        btn.selected = NO;
    }
    NSLog(@"%@", string);
    
    // 清空路径
    [self.selectBtnArray removeAllObjects];
    [self setNeedsDisplay];
}


// 获取当前手指所在的点
- (CGPoint)locationInView:(NSSet *)touches {
    UITouch *touch = touches.anyObject;
    return [touch locationInView:self];
}

// 判断一个点是否在某个区域内
- (UIButton *)rectContainsPoint:(CGPoint)point {
    for (UIButton *btn in self.subviews) {
        if(CGRectContainsPoint(btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}


#pragma mark - init

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

// 添加按钮
- (void)setUp {
    self.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:.3];
    
    for (int i = 0; i < 9; i++) {
        // 创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i; // 绑定
        
        btn.userInteractionEnabled = NO;
        btn.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:0.1];
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        [self addSubview:btn];
    }
}

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
    
    if (self.selectBtnArray.count <= 0) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.selectBtnArray.count; i++) {
        UIButton * btn = self.selectBtnArray[i];
        if (i == 0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    
    [path addLineToPoint:self.curP];
    [path setLineJoinStyle:kCGLineJoinRound]; // 圆角
    
    [UIColor.cyanColor set];
    [path setLineWidth:9];
    [path stroke];
}


@end


