//
//  LocationTool.m
//  ios_101509
//
//  Created by Apple on 2017/9/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LocationTool.h"

#import <UIKit/UIKit.h>

#define isIOS(version) ([[UIDevice currentDevice].systemVersion floatValue] >= version)

@interface LocationTool() <CLLocationManagerDelegate>

@property (copy, nonatomic) ResultBlock block; // 记录要执行的代码块

@property (strong, nonatomic) CLLocationManager *manager; // 位置管理者

@property (strong, nonatomic) CLGeocoder *clGeocode; // 地理编码管理器

@end



@implementation LocationTool

singleM(LocationTool)

- (void)getLocation:(ResultBlock)block {
    self.block = block; // 记录代码块
    
    if ([CLLocationManager locationServicesEnabled]) {
        [self.manager startUpdatingLocation];
    } else {
        self.block(nil, nil, @"location service is off");
    }
}

#pragma mark - CLLocationManagerDelegate start
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    
    if (location.horizontalAccuracy < 0) {
        return;
    }
    
    [self.clGeocode reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (nil == error) {
            self.block(location, [placemarks firstObject], nil);
        } else {
            self.block(location, nil, error.localizedDescription);
        }
    }];
    [manager stopUpdatingLocation]; // 关闭定位服务
}
#pragma mark - CLLocationManagerDelegate end


#pragma mark - lazy load
- (CLLocationManager *)manager {
    if (nil == _manager) {
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        
        // 在 9.0 之前没有输出一定要在模拟器界面时 - Debug - Location 切换经纬度
        // General - Deployment Info - Deployment Target 选择低于 9.0 版本才能选择低于 9.0 的模拟器
        
        if (isIOS(8.0)) {
            NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
//            NSLog(@"infoDict:%@", infoDict);
            
            NSString *alwaysUsage = infoDict[@"NSLocationAlwaysUsageDescription"];
            NSString *whenInUsage = infoDict[@"NSLocationWhenInUseUsageDescription"];
            NSLog(@"alwaysUsage: %@; whenInUsage: %@", alwaysUsage, whenInUsage);

            if ([alwaysUsage length] > 0) {
                NSLog(@"alwaysUsage");
                [_manager requestAlwaysAuthorization];
                // location when in use usage description / 使用app时允许
            } else if ([whenInUsage length] > 0) {
                NSLog(@"whenInUsage");
                [_manager requestWhenInUseAuthorization];
                
                // 在前台定位授权状态下, 必须勾选 capabilities - Background Mode - Location updates 才能获取用户位置信息
                
                NSArray *services = infoDict[@"UIBackgroundModes"];
                if (![services containsObject:@"location"]) {
                    NSLog(@"在前台定位授权状态下, 必须勾选 capabilities - Background Mode - Location updates 才能获取用户位置信息");
                } else {
                    if (isIOS(9.0)) {
                        self.manager.allowsBackgroundLocationUpdates = YES; // 9.0 添加
                    }
                }
            } else {
                NSLog(@"Error : must specified NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription in Info.plist");
            }
        }
    }
    return _manager;
}

- (CLGeocoder *)clGeocode {
    if (nil == _clGeocode) {
        _clGeocode = [[CLGeocoder alloc] init];
    }
    return _clGeocode;
}

@end


