//
//  ViewController.m
//  ios_101603
//
//  Created by Apple on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>



@interface ViewController ()

@property (strong, nonatomic) CLGeocoder *geocoder;

@end



@implementation ViewController

- (IBAction)navigation:(UIButton *)sender {
    [self.geocoder geocodeAddressString:@"度尾农村信用社" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(nil == error) {
            CLPlacemark *src = [placemarks firstObject];
            
            [self.geocoder geocodeAddressString:@"仙游度尾镇农业银行" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                
                CLPlacemark *dest = [placemarks firstObject];
                
                [self beginNavWithBeginPL:src endPL:dest];
            }];
        }
    }];
}

- (void)beginNavWithBeginPL:(CLPlacemark *)beginCLPL endPL:(CLPlacemark *)endCLPL {
    // 存放起点和终点的信息
    
    MKPlacemark *beginPL = [[MKPlacemark alloc] initWithPlacemark:beginCLPL];
    MKMapItem *beginItem = [[MKMapItem alloc] initWithPlacemark:beginPL];
    
    MKPlacemark *endPL = [[MKPlacemark alloc] initWithPlacemark:endCLPL];
    MKMapItem *endItem = [[MKMapItem alloc] initWithPlacemark:endPL];
    
    NSArray *items = @[beginItem, endItem];
    
    // 启动参数设置(地图类型, 导航方式)
    NSDictionary *dict = @{
                           MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving,
                           MKLaunchOptionsMapTypeKey : @(MKMapTypeStandard),
                           MKLaunchOptionsShowsTrafficKey : @(YES)
                           };
    
    [MKMapItem openMapsWithItems:items launchOptions:dict];
}


#pragma mark lazy loading
- (CLGeocoder *)geocoder {
    if (nil == _geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

@end


