//
//  ViewController.m
//  ios_101505
//
//  Created by Apple on 2017/9/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>


#define isIOS(version) ([[UIDevice currentDevice].systemVersion floatValue] >= version)

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;

@property (weak, nonatomic) IBOutlet UIImageView *compassView;

@end



@implementation ViewController

// 设备朝向 - 真机测试
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    NSLog(@"newHeading: %@, headingAccuracy: %f", newHeading, newHeading.headingAccuracy);
    
    if (newHeading.headingAccuracy < 0) {
        return;
    }
    
    // 1, 获取设备朝向
    CLLocationDirection angle = newHeading.magneticHeading;
    
    // 1.1 角度转弧度
    float radius = angle / 180.0 * M_PI;
//    NSLog(@"angle: %f, radius: %f", angle, radius);
    
    // 2, 反方向旋转指南针图片
    [UIView animateWithDuration:.5 animations:^{
        self.compassView.transform = CGAffineTransformMakeRotation(-radius);
    }];
}


#pragma mark lazy load
- (CLLocationManager *)manager {
    if (nil == _manager) {
        // 1, 创建位置管理者
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        
        if (isIOS(8.0)) {
            [_manager requestAlwaysAuthorization]; // 一直定位 : NSLocationAlwaysUsageDescription
        }
    }
    return _manager;
}

#pragma mark 真机测试
- (void)updateHeading {
    // 获取当前设备朝向(磁力计传感器) - 真机测试
    //    NSLog(@"%s", __func__);
    [self.manager startUpdatingHeading];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateHeading];
}

@end


