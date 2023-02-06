//
//  ViewController.m
//  ios_091601
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *vRed;

@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end



@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    XLog
    [UIView animateWithDuration:3 animations:^{
        self.iv.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
//        self.iv.layer.transform = CATransform3DMakeTranslation(100, 50, 1);
//        self.iv.layer.transform = CATransform3DMakeScale(1.1, 1.1, 0);
        
        // 3d 旋转一般不用 kvc, 快速缩放/平移/二维旋转用到 kvc
        
        // 把结构体转成对象
//        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
//        [self.iv.layer setValue:value forKey:@"transform"];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self uiViewlayer];
    
    [self uiImageViewlayer];
}

- (void)uiImageViewlayer {
    self.iv.layer.shadowOpacity = 1;
    self.iv.layer.shadowOffset = CGSizeMake(10, 10);
    self.iv.layer.shadowRadius = 10;
    self.iv.layer.shadowColor = UIColor.cyanColor.CGColor;
    
    // borderColor 和 borderWidth 一起使用
    self.iv.layer.borderColor = UIColor.blueColor.CGColor;
    self.iv.layer.borderWidth = 3;
    self.iv.layer.cornerRadius = 20;
//    self.imageView.layer.masksToBounds = YES; // 超过根层以外的全部被裁剪
}

- (void)uiViewlayer {
    self.vRed.layer.shadowOpacity = 1; // 自带阴影效果
    self.vRed.layer.shadowOffset = CGSizeMake(10, 10); // 设置阴影的偏移量
    self.vRed.layer.shadowRadius = 10; // 阴影的模糊程度
    self.vRed.layer.shadowColor = UIColor.cyanColor.CGColor; // 阴影颜色
    
    // borderColor 和 borderWidth 一起使用
    self.vRed.layer.borderColor = UIColor.blueColor.CGColor; // 边框颜色
    self.vRed.layer.borderWidth = 3; // 边框宽度
    self.vRed.layer.cornerRadius = 20; // 圆角半径
}

@end


