//
//  ViewController.m
//  ios_020301
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"


@interface ViewController() {
    int _screenW;
    int _screenH;
    
    
    NSArray *_descArray;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _screenW = self.view.frame.size.width;
    _screenH = self.view.frame.size.height;
    
    
    // 1, 获得所有的描述
    NSString *path = [[NSBundle mainBundle] pathForResource:@"descs" ofType:@"plist"]; // 2, 获得文件的全路径
//    NSLog(@"path:%@", path);

    _descArray = [NSArray arrayWithContentsOfFile:path]; // 3, 加载 path 对应的文件来创建数组
    _lbDesc.text = _descArray[0];
    
    
    CGRect frame = _settingView.frame;
    frame.origin.y = self.view.frame.size.height;
    frame.size.width = self.view.frame.size.width;
    _settingView.frame = frame;
    
    //
//    _contentSlide.continuous = NO; // 滑动结束调用
}


- (IBAction)contentSliderValueChange:(UISlider *)sender {
    NSLog(@"sliderValueChange : %f", sender.value); // sender.value = [0 ~ 15]
    
    _lbNo.text = [NSString stringWithFormat:@"%.f/16", sender.value + 1]; // 设置序号
    // .0f == .f (不保留小数) ; %02 表示保持两位数格式
    NSString *imageNamed = [NSString stringWithFormat:@"img%02.f.png", sender.value];
    _imageView.image = [UIImage imageNamed:imageNamed]; // 设置中间的图片
    _lbDesc.text = _descArray[(int)round(sender.value)]; // 设置描述
}


- (IBAction)setting {
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint center = _settingView.center; // 1, 取出中点
        if(_settingView.frame.origin.y >= _screenH) {
            center.y = _screenH - _settingView.frame.size.height / 2; // 2, 修改 y 值
        } else {
            center.y = _screenH + _settingView.frame.size.height / 2; // 2, 修改 y 值
        }
        _settingView.center = center; // 3, 重新赋值
    }];
}


- (IBAction)nightMode:(UISwitch *)sender {
    if(sender.on) {
        self.view.backgroundColor = [UIColor darkGrayColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


- (IBAction)imageScaleSlideValueChange:(UISlider *)sender {
//    CGRect frame = _imageView.frame; // 1

    // 这里用 frame 不大合适
//    frame.size.width = sender.value * 375; // 2
//    frame.size.height = sender.value * 150; // 2
//    
//    _imageView.frame = frame; // 3
    
    _imageView.transform = CGAffineTransformMakeScale(sender.value, sender.value);
//    _imageView.transform = CGAffineTransformScale(_imageView.transform, sender.value, sender.value);
}


@end




