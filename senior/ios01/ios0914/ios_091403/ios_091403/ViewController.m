//
//  ViewController.m
//  ios_091403
//
//  Created by Apple on 2017/8/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 手指开始点
@property(nonatomic,assign)CGPoint startP;
// 遮盖
@property(nonatomic,weak) UIView *coverView;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@end

@implementation ViewController

// 懒加载遮盖,保存遮盖只创建一次.
-(UIView *)coverView{
    if (_coverView == nil) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.7;
        [self.view addSubview:view];
        _coverView = view;
    }
    return _coverView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)pan:(UIPanGestureRecognizer *)pan {
    
    // 获取当前手指所在的点.
    CGPoint curP = [pan locationInView:self.view];
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        CGPoint startP = curP;
        self.startP = startP;
        
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        
        CGFloat offsetX = curP.x - self.startP.x;
        CGFloat offsetY = curP.y - self.startP.y;
  
        // 每次移动时,调用遮盖的Frame.
        self.coverView.frame = CGRectMake(self.startP.x, self.startP.y, offsetX, offsetY);
        
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        
        // 1.开启一个跟原始图片相同大小的图片上下文.
        UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
        // 把self.cover.frame 设为裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [path addClip];
        // 获取当前上下文.
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        // 把UIImageView当中的图片给绘制上下文当中.
        [self.imageV.layer renderInContext:ctx];
        // 从上下文当中生成一张新的图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文.
        UIGraphicsEndImageContext();
        // 给图片重新赋值
        self.imageV.image = newImage;
        // 移除遮盖
        [self.coverView removeFromSuperview];
        
    }

}


@end


