//
//  ViewController.m
//  ios_101507
//
//  Created by Apple on 2017/9/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>

#define isIOS(version) ([[UIDevice currentDevice].systemVersion floatValue] >= version)

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) CLGeocoder *geocode;

@property (weak, nonatomic) IBOutlet UITextView *addressField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

@end



@implementation ViewController

// 度尾镇 : latitude:25.409067, longitude:118.581085
- (IBAction)geocode:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSString *address = self.addressField.text;
    if (0 == [address length]) {
        NSLog(@"address is nil");
        return;
    }
    
    [self.geocode geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        NSLog(@"placemarks:%@", placemarks);
        
        CLPlacemark *pl = [placemarks firstObject];
    
        if (nil == error) {
            NSLog(@"latitude: %f, longitude: %f", pl.location.coordinate.latitude, pl.location.coordinate.longitude);
            
            self.addressField.text = pl.name;
            self.latitudeField.text = @(pl.location.coordinate.latitude).stringValue;
            self.longitudeField.text = @(pl.location.coordinate.longitude).stringValue;
        } else {
            NSLog(@"error: %@", error);
        }
    }];
}

- (IBAction)reverseGeocode:(UIButton *)sender {
    [self.view endEditing:YES];
    
    double latitude = [self.latitudeField.text doubleValue];
    double longitude = [self.longitudeField.text doubleValue];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
    [self.geocode reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *pl = [placemarks firstObject];
        
        if (nil == error) {
            NSLog(@"name: %@", pl.name);
            self.addressField.text = pl.name;
        } else {
            NSLog(@"error:%@", error);
        }
    }];
}

#pragma mark lazy load
- (CLLocationManager *)locationManager {
    if (nil == _locationManager) {
        // 1, 创建位置管理者
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        
        if (isIOS(8.0)) {
            [_locationManager requestAlwaysAuthorization];
        }
    }
    return _locationManager;
}

- (CLGeocoder *)geocode {
    if (nil == _geocode) {
        _geocode = [[CLGeocoder alloc] init];
    }
    return _geocode;
}

@end


