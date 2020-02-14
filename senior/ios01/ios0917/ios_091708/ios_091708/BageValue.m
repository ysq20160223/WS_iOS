//
//  BageValue.m
//  ios_091708
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BageValue.h"
#import "Distance.h"

#define maxDragDistance 250

@interface BageValue ()

@property (weak, nonatomic) UIView *smallCircle;

@property (weak, nonatomic) CAShapeLayer *shape;

@end



@implementation BageValue

- (CAShapeLayer *)shape {
    if (_shape == nil) {
        // 创建形状图层
        CAShapeLayer *shape = [CAShapeLayer layer];
        _shape = shape;
        shape.fillColor = [UIColor redColor].CGColor;
        [self.superview.layer insertSublayer:shape atIndex:0];
    }
    return _shape;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

// 初始化
- (void)setUp {
    self.layer.masksToBounds = YES;
    
    self.layer.cornerRadius = 44; // 设置圆角
    self.titleLabel.font = [UIFont systemFontOfSize:21];
    [self setBackgroundColor:[UIColor redColor]]; //
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    // 添加小圆
    UIView *smallCircle = [[UIView alloc] init];
    smallCircle.frame = self.frame;
    smallCircle.layer.cornerRadius = self.layer.cornerRadius;
    smallCircle.backgroundColor = self.backgroundColor;
    
    self.smallCircle = smallCircle;
    
    [self.superview insertSubview:smallCircle belowSubview:self];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint tranP = [pan translationInView:self]; // 当前移动的偏移量
    
    // transform 并没有修改 center, 修改的 frame
//    self.transform = CGAffineTransformTranslate(self.transform, tranP.x, tranP.y);
    CGPoint center = self.center;
    center.x += tranP.x;
    center.y += tranP.y;
    self.center = center;
    
    [pan setTranslation:CGPointZero inView:self]; // 复位
    
    CGFloat distance = [Distance distanceWithCircleA:self.smallCircle andCircleB:self];
//    NSLog(@"distance = %f", distance);
    
    CGFloat radius = self.bounds.size.width * .5; // 取出大圆的半径
    radius = radius - distance / 6.0;
    if (radius < 0) {
        radius = 0;
    }
//    NSLog(@"radius = %f", radius);
    
    self.smallCircle.bounds = CGRectMake(0, 0, radius * 2, radius * 2); // 重新设置小圆的宽高
    self.smallCircle.layer.cornerRadius = radius;
    
    
    if (self.smallCircle.hidden == NO) {
        // 返回一个不规则的路径
        UIBezierPath *path = [self pathWithCircleA:self.smallCircle andCircleB:self];
        self.shape.path = path.CGPath;
    }
    
    // 拖动的长度
    if(distance > maxDragDistance) {
        self.smallCircle.hidden = YES;
//        self.shape.hidden = YES; // 直接隐藏
        [self.shape removeFromSuperlayer]; // 具有粘附效果
    }
    
    if(pan.state == UIGestureRecognizerStateEnded) {
        if (distance < maxDragDistance) {
            self.center = self.smallCircle.center;
            [self.shape removeFromSuperlayer];
            self.smallCircle.hidden = NO;
        } else {
            // 播放一个动画
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
            
            NSMutableArray *imageArray = [NSMutableArray array];
            
            for (int i = 0; i < 8; i++) {
                NSString *imageName = [NSString stringWithFormat:@"%d", i + 1];
                UIImage *image = [UIImage imageNamed:imageName];
                [imageArray addObject:image];
            }
            imageView.animationImages = imageArray;
            [imageView setAnimationDuration:8];
            [imageView startAnimating];
            
            [self addSubview:imageView];
            
            // 消失
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
            });
            
        }
    }
    
}

// 根据两个圆描述一个不规则的路径
- (UIBezierPath *)pathWithCircleA:(UIView *)a andCircleB:(UIView *)b {
    CGFloat x1 = a.center.x; //
    CGFloat x2 = b.center.x;
    
    CGFloat y1 = a.center.y;
    CGFloat y2 = b.center.y;
    
    CGFloat distance = [Distance distanceWithCircleA:a andCircleB:b];
    
    CGFloat cos = (y2 - y1) / distance;
    CGFloat sin = (x2 - x1) / distance;
    
    CGFloat r1 = a.bounds.size.width * .5;
    CGFloat r2 = b.bounds.size.width * .5;
    
    CGPoint pointA = CGPointMake(x1 - r1 * cos, y1 + r1 * sin);
    CGPoint pointB = CGPointMake(x1 + r1 * cos, y1 - r1 * sin);
    CGPoint pointC = CGPointMake(x2 + r2 * cos, y2 - r2 * sin);
    CGPoint pointD = CGPointMake(x2 - r2 * cos, y2 + r2 * sin);
    
    CGPoint pointO = CGPointMake(pointA.x + distance * .5 * sin, pointA.y + distance * .5 * cos);
    CGPoint pointP = CGPointMake(pointB.x + distance * .5 * sin, pointB.y + distance * .5 * cos);
    
    // 描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // ab
    [path moveToPoint:pointA];
    [path addLineToPoint:pointB];
    
    // bc 曲线
    [path addQuadCurveToPoint:pointC controlPoint:pointP];
    
    // cd
    [path addLineToPoint:pointD];
    
    // da 曲线
    [path addQuadCurveToPoint:pointA controlPoint:pointO];
    
    return path;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}


@end


