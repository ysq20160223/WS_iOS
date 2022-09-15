//
//  ViewController.m
//  ios_020301
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIBezierPath+X.h"

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
    
    
    // 1, 获得所有的描述; 2, 获得文件的全路径
    NSString *path = [NSBundle.mainBundle pathForResource:@"descs.plist" ofType:nil];
//    NSLog(@"path:%@", path);

    _descArray = [NSArray arrayWithContentsOfFile:path]; // 3, 加载 path 对应的文件来创建数组
    _lblDesc.text = _descArray[0];
    
    
    CGRect frame = _viewSetting.frame;
    frame.origin.y = _screenH;
    frame.size.width = _screenW;
    _viewSetting.frame = frame;
    
//    _contentSlide.continuous = NO; // 滑动结束调用
    
    self.btnSetting.layer.cornerRadius = 6;
    self.btnSetting.layer.masksToBounds = YES;
    self.switchDayNight.on = YES;
    [self onClickDayNightMode:self.switchDayNight];
    
//    self.viewSetting.layer.cornerRadius = 8;
//    self.viewSetting.layer.masksToBounds = YES;
    
    [UIBezierPath addShapeLayer:self.viewSetting byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
    
}


- (IBAction)contentSliderValueChange:(UISlider *)sender {
    NSLog(@"value: %f; %ld", sender.value, lround(sender.value)); // sender.value = [0 ~ 15]
    
    _lblNo.text = [NSString stringWithFormat:@"%.f/16", sender.value + 1]; // 设置序号
    // .0f == .f (不保留小数) ; %02 表示保持两位数格式
    NSString *imageNamed = [NSString stringWithFormat:@"img%02.f", sender.value];
    _imageView.image = [UIImage imageNamed:imageNamed]; // 设置中间的图片
    _lblDesc.text = _descArray[lround(sender.value)]; // 设置描述
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self onClickSetting];
//}

- (IBAction)onClickSetting {
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint center = _viewSetting.center; // 1, 取出中点
        NSLog("%@", NSStringFromCGPoint(center))
        if(_viewSetting.frame.origin.y >= _screenH) {
            center.y = _screenH - _viewSetting.frame.size.height / 2; // 2, 修改 y 值
        } else {
            center.y = _screenH + _viewSetting.frame.size.height / 2; // 2, 修改 y 值
        }
        _viewSetting.center = center; // 3, 重新赋值
    }];
}

- (IBAction)onClickDayNightMode:(UISwitch *)sender {
//    NSLog(@"on: %d", sender.on);
    self.view.backgroundColor = sender.on ? XColor(0x33, 0x33, 0x33) : UIColor.whiteColor;
    
    self.btnSetting.backgroundColor = sender.on ? XColor(0x55, 0x55, 0x55) : XColor(0xee, 0xee, 0xee);
    [self.btnSetting setTitleColor:(sender.on ? UIColor.whiteColor : UIColor.blackColor) forState:UIControlStateNormal];
    
    self.lblNo.textColor = sender.on ? UIColor.whiteColor : UIColor.blackColor;
    self.lblNo.backgroundColor = sender.on ? XColor(0x55, 0x55, 0x55) : XColor(0xee, 0xee, 0xee);
    
    self.lblDesc.textColor = sender.on ? UIColor.whiteColor : UIColor.blackColor;
    self.lblDesc.backgroundColor = sender.on ? XColor(0x55, 0x55, 0x55) : XColor(0xee, 0xee, 0xee);
    
    self.slideContent.tintColor = sender.on ? UIColor.whiteColor : XColor(0x55, 0x55, 0x55);
    self.slideContent.thumbTintColor = sender.on ? UIColor.whiteColor : XColor(0x55, 0x55, 0x55);
    self.slideContent.minimumTrackTintColor = sender.on ? UIColor.whiteColor : XColor(0x55, 0x55, 0x55);
    self.slideContent.maximumTrackTintColor = sender.on ? XColor(0x22, 0x22, 0x22) : XColor(0xaa, 0xaa, 0xaa);
//    self.slideContent.minimumTrackTintColor = UIColor.cyanColor;
//    self.slideContent.minimumTrackTintColor = UIColor.magentaColor;
    self.slideContent.backgroundColor = sender.on ? XColor(0x55, 0x55, 0x55) : XColor(0xee, 0xee, 0xee);
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


