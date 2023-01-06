//
//  ViewController.m
//  ios_091601
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:9 animations:^{
        self.imageView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
//        self.imageView.layer.transform = CATransform3DMakeTranslation(100, 50, 1);
//        self.imageView.layer.transform = CATransform3DMakeScale(1.1, 1.1, 0);
        
        // 3d 旋转一般不用 kvc, 快速缩放/平移/二维旋转用到 kvc
        
        // 把结构体转成对象
//        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
//        [self.imageView.layer setValue:value forKey:@"transform"];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self uiViewlayer];
    
    [self uiImageViewlayer];
}

- (void)uiImageViewlayer {
    self.imageView.layer.shadowOpacity = 1;
    self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
    
    self.imageView.layer.shadowRadius = 10;
    self.imageView.layer.shadowColor = UIColor.cyanColor.CGColor;
    
    // borderColor 和 borderWidth 一起使用
    self.imageView.layer.borderColor = UIColor.blueColor.CGColor;
    self.imageView.layer.borderWidth = 3;
    
    self.imageView.layer.cornerRadius = 20;
    
//    self.imageView.layer.masksToBounds = YES; // 超过根层以外的全部被裁剪
}

- (void)uiViewlayer {
    self.redView.layer.shadowOpacity = 1; // 自带阴影效果
    self.redView.layer.shadowOffset = CGSizeMake(10, 10); // 设置阴影的偏移量
    self.redView.layer.shadowRadius = 10; // 阴影的模糊程度
    self.redView.layer.shadowColor = UIColor.cyanColor.CGColor; // 阴影颜色
    
    // borderColor 和 borderWidth 一起使用
    self.redView.layer.borderColor = UIColor.blueColor.CGColor; // 边框颜色
    self.redView.layer.borderWidth = 3; // 边框宽度
    
    self.redView.layer.cornerRadius = 20; // 圆角半径
}

@end


