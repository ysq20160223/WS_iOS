//
//  ViewController.m
//  ios_020301
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "../../../../PreHeader.h"


@interface ViewController() {
    NSArray *_allDescArray;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1, 获得所有的描述
    NSString *path = [[NSBundle mainBundle] pathForResource:@"descs" ofType:@"plist"]; // 2, 获得文件的全路径
//    NSLog(@"path:%@", path);
    
    _allDescArray = [NSArray arrayWithContentsOfFile:path]; // 3, 加载 path 对应的文件来创建数组
//    NSLog(@"_allDesc:%@", _allDesc);
    
    _imageDesc.text = _allDescArray[0];
    
    
    CGRect frame = _settingView.frame;
    frame.origin.y = self.view.frame.size.height;
    frame.size.width = self.view.frame.size.width;
    _settingView.frame = frame;
}


- (IBAction)sliderValueChange:(UISlider *)sender {
    
//    NSLog(@"sliderValueChange : %f", sender.value);
    
    NSString *imageNamed = [NSString stringWithFormat:@"img%.f.png", sender.value]; // .0f == .f (不保留小数)
    _imageView.image = [UIImage imageNamed:imageNamed]; // 1, 设置中间的图片
    
    _imageNo.text = [NSString stringWithFormat:@"%.0f/16", sender.value + 1]; // 2, 设置序号
    
    _imageDesc.text = _allDescArray[(int)(sender.value + 0.5)]; // 3, 设置描述
}

- (IBAction)setting {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    CGPoint center = _settingView.center; // 1, 取出中点
    
//    center.y -= _settingView.bounds.size.height; // 2, 修改 y 值
//    center.y -= _settingView.frame.size.height; // 2, 修改 y 值
    
    if(_settingView.frame.origin.y == self.view.frame.size.height) {
        center.y -= _settingView.frame.size.height; // 2, 修改 y 值
    } else {
        center.y += _settingView.frame.size.height; // 2, 修改 y 值
    }
    _settingView.center = center; // 3, 重新赋值
    
    [UIView commitAnimations];
}

- (IBAction)nightMode:(UISwitch *)sender {
    if(sender.on) {
        self.view.backgroundColor = [UIColor darkGrayColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)imageSizeChange:(UISlider *)sender {
//    CGRect frame = _imageView.frame; // 1

    // 这里用 frame 不大合适
//    frame.size.width = sender.value * 375; // 2
//    frame.size.height = sender.value * 150; // 2
//    
//    _imageView.frame = frame; // 3
    
    _imageView.transform = CGAffineTransformMakeScale(sender.value, sender.value);
    
}

@end




