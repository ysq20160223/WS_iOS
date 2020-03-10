//
//  ViewController.m
//  ios_101500
//
//  Created by Apple on 2017/9/2.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 
 LBS : location based service
 SoLoMo : socical local mobile
 
 */

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>

#define isIOS(version) ([[UIDevice currentDevice].systemVersion floatValue] >= version)

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *lastCLLocation;

@end



@implementation ViewController

- (IBAction)requestLocation:(UIButton *)sender {
    NSLog(@"");
    
    // --- 单次请求定位
    // 按照精确度从低到高逐个定位, 如果在有效时间内, 定位到精确度最高的位置, 直接通过代理通知外界
    // 如果当前还没有定位到精确度最高的位置, 但是已经超时, 就会把当前精确度对应的位置信息通过代理通知外界
    // 不能和 startUpdatingLocation 一起使用
    if (isIOS(9.0)) {
        [self.locationManager requestLocation];
    }
}


- (IBAction)authorization:(UIButton *)sender {
    NSLog(@"");
    
    // 2, 使用位置管理者, 开始更新用户位置信息
    [self.locationManager startUpdatingLocation];
    
    // 标准定位服务(GPS/WIFI/基站) : 程序关闭就无法获取位置
    
    // 显著位置变化定位服务(基站定位 : 需要有 SIM 功能)
    // 1, 当 app 完成被关闭时, 也可以接收到位置通知, 并让 app 进入到后台处理
    // 2, 定位精度不大, 耗电小,定位更新频率依据基站密度而定
    //    [self.manager startMonitoringSignificantLocationChanges];
}


#pragma mark - CLLocationManagerDelegate start
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    [self.locationManager stopUpdatingLocation];

    // 按时间排序, 拿到最新位置
    CLLocation *location = [locations lastObject];
//    NSLog(@"location:%@", location);
    
    // 当前位置不可用
    if (location.horizontalAccuracy < 0) {
        return;
    }
    
    // 1, 确定当前航向
    NSInteger index = (int) location.course / 90;
    NSArray *courseArray = @[@"北偏东", @"东偏南", @"南偏西", @"西偏北"];
    NSString *course = courseArray[index];
    
    
    // 2, 确定偏离角度
    NSInteger angle = (int)location.course % 90;
    if (0 == angle) {
        course = [@"正" stringByAppendingString:[course substringToIndex:1]];
    }
    
    // 3, 确定行走距离
    CGFloat distance = 0;
    if (_lastCLLocation) {
        distance = [location distanceFromLocation:_lastCLLocation];
    }
    _lastCLLocation = location;
    
    // 4, 拼接
    NSLog(@"course: %@, angle: %zd, distance: %f",course, angle, distance);
}

// 当前定位授权状态发生改变
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"NotDetermined");
            break;
            
        case kCLAuthorizationStatusRestricted:
            NSLog(@"Restricted");
            break;
            
        case kCLAuthorizationStatusDenied:
            NSLog(@"Denied");
            
            // 1, 当前设备是否支持定位
            // 2, 定位服务是否开启
            if ([CLLocationManager locationServicesEnabled]) {
                NSLog(@"User Denied");
                
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
                
            } else {
                NSLog(@"Device Location Service Off");
            }
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"AuthorizedAlways");
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"AuthorizedWhenInUse");
            break;
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"error: %@", error);
}
#pragma mark - CLLocationManagerDelegate end


#pragma mark - lazy load
- (CLLocationManager *)locationManager {
    if (nil == _locationManager) {
        // 1, 创建位置管理者
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        
//        _locationManager.distanceFilter = 100;
//        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // -------- 适配 iOS8.0 系统
        // 如果定位失败则 : Debug - Location - (None - Custom Location...)
        // 默认情况下, 只能在前台获取用户位置信息
        // 如果想要在后台获取用户位置, 就必须勾选 location updates, 会出现蓝条不断提醒用户
        // 方案1
        if (isIOS(8.0)) {
//            [_locationManager requestWhenInUseAuthorization]; // 使用时定位 : NSLocationWhenInUseUsageDescription
            [_locationManager requestAlwaysAuthorization]; // 一直定位 : NSLocationAlwaysUsageDescription
            
            
            // -------- 适配 iOS9.0 系统
            // 当前处于前台定位授权状态下, 即使勾选了 location updates, 也不会获取用户位置, 除非设置以下属性
//            if (isIOS(9.0)) {
//                _locationManager.allowsBackgroundLocationUpdates = YES;
//            }
            
        }
        
        // 方案2
        //        if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        //            [_locationManager requestAlwaysAuthorization];
        //        }
    }
    return _locationManager;
}

@end


