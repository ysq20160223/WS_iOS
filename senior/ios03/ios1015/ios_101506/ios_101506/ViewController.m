//
//  ViewController.m
//  ios_101506
//
//  Created by Apple on 2017/9/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>

#define isIOS(version) ([[UIDevice currentDevice].systemVersion floatValue] >= version)

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self monitoringRegion];
}

#pragma mark - monitorRegion
- (void)monitoringRegion {
    // 判断当前设备是否支持区域监听
    if (![CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        NSLog(@"not Monitoring Available");
        return;
    }
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(22.539999, 114.111111);
    
    CLLocationDistance radius = 1000.0;
    if (radius > self.locationManager.maximumRegionMonitoringDistance) {
        radius = self.locationManager.maximumRegionMonitoringDistance;
    }
    
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:center radius:radius identifier:@"hh"];
    
//    [self.manager startMonitoringForRegion:region];
    [self.locationManager requestStateForRegion:region]; // 请求区域状态
}

#pragma mark - CLLocationManagerDelegate start
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"enter region: %@", region);
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"exit region: %@", region);
}

// 请求区域状态 回调
- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    NSLog(@"determine state: %ld; region: %@", state, region);
    
    // CLRegionStateUnknown : 0
    // CLRegionStateInside : 1
    // CLRegionStateOutside : 2
}
#pragma mark - CLLocationManagerDelegate end


#pragma mark -
- (CLLocationManager *)locationManager {
    if (nil == _locationManager) {
        // 1, 创建位置管理者
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        
        if (isIOS(8.0)) {
            [_locationManager requestAlwaysAuthorization]; // 一直定位 : NSLocationAlwaysUsageDescription
        }
    }
    return _locationManager;
}

@end


