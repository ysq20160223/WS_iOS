//
//  WheelView.m
//  ios_091612
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "WheelView.h"

#import "WheelBotton.h"

@interface WheelView ()

@property (weak, nonatomic) IBOutlet UIImageView *contentView;

@property (weak, nonatomic) UIButton *preBtn;

@property (strong, nonatomic) CADisplayLink *link;

@end



@implementation WheelView

// 开始选号
- (IBAction)startChoose:(id)sender {
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 2);
    anim.duration = 5;
    anim.repeatCount = MAXFLOAT;
    
    [self.contentView.layer addAnimation:anim forKey:nil];
}

- (CADisplayLink *)link {
    if (_link == nil) {
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        _link = link;
    }
    return _link;
}

//
- (void)start {
    self.link.paused = NO;
}

- (void)update {
    // 让转盘开始旋转
    self.contentView.transform = CGAffineTransformRotate(self.contentView.transform, M_PI / 200.0);
}

//
- (void)stop {
    self.link.paused = YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}

// 添加按钮
- (void)setUp {
    // 加载原始图片
    UIImage *oriImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *oriSelImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    // 获取当前屏幕与像素坐标的比例
    CGFloat scale = [UIScreen mainScreen].scale;
    
    CGFloat clipW = oriImage.size.width / 12 * scale;
    CGFloat clipH = oriImage.size.height * scale;
    CGFloat clipX = 0;
    CGFloat clipY = 0;
    
    // 添加按钮
    self.contentView.userInteractionEnabled = YES;
    
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    CGFloat angle = 0;
    for (int i = 0; i < 12; i++) {
        WheelBotton *btn = [WheelBotton buttonWithType:UIButtonTypeCustom];
        
        btn.bounds = CGRectMake(0, 0, btnW, btnH); //
        btn.layer.anchorPoint = CGPointMake(.5, 1);
        btn.layer.position = CGPointMake(self.bounds.size.width * .5, self.bounds.size.height * .5);
        
//        btn.imageView.contentMode = UIViewContentModeCenter;
        
//        [btn setBackgroundColor:[UIColor cyanColor]];
        
        // 裁剪图片当中的某一块区域
        clipX = i * clipW;
        CGRect rect = CGRectMake(clipX, clipY, clipW, clipH);
        
        // 裁剪正常状态下的图片
        CGImageRef clipImage = CGImageCreateWithImageInRect(oriImage.CGImage, rect);
        // 裁剪选中状态下的图片
        CGImageRef clipSelImage = CGImageCreateWithImageInRect(oriSelImage.CGImage, rect);
        
        
        // 设置按钮的图片 - 把 CGImageRef 转成 UIImage
        UIImage *clipNewImage = [UIImage imageWithCGImage:clipImage];
        [btn setImage:clipNewImage forState:UIControlStateNormal];
        
        // 设置选中状态下的图片
        UIImage *clipSelNewImage = [UIImage imageWithCGImage:clipSelImage];
        [btn setImage:clipSelNewImage forState:UIControlStateSelected];
        
        // 设置选中图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside]; // 监听点击
        
        [self.contentView addSubview:btn];
        
        btn.transform = CGAffineTransformMakeRotation(angle / 180.0 * M_PI);
        angle += 30;
        
        // 默认选中第一个按钮
        if(i == 0) {
            [self btnClick:btn];
        }
    }
}

- (void)btnClick:(UIButton *)btn {
    self.preBtn.selected = NO; // 让上一个选中的按钮取消选中状态
    btn.selected = YES; // 让当前选中的按钮称为选中状态
    self.preBtn = btn; // 把当前的按钮赋值给上一个按钮
}

// heelView *wheelView = [[WheelView alloc] init]; 调用
- (instancetype)initWithFrame:(CGRect)frame {
//    NSLog(@"%s", __func__);
    
    if(self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil][0];
        [self setUp];
    }
    return self;
}

//
+ (instancetype)wheelView {
//    NSLog(@"%s", __func__);
    
    return [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil][0];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}


@end


