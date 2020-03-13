//
//  ViewController.m
//  ios_101604
//
//  Created by Apple on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>

@property (strong, nonatomic) CLGeocoder *geocoder;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end



// 101604
@implementation ViewController

- (IBAction)circle:(UIButton *)sender {
//    MKCircle *circle = [MKCircle circleWithCenterCoordinate:self.mapView.centerCoordinate radius:1000000];
//    [self.mapView addOverlay:circle];
}


- (IBAction)route:(id)sender {
    [self.geocoder geocodeAddressString:@"度尾农村信用社" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (nil == error) {
            
            CLPlacemark *src = [placemarks firstObject];
            
            [self.geocoder geocodeAddressString:@"度尾农业银行" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                
                CLPlacemark *dest = [placemarks firstObject];
                
                [self getRouteWithBeginCLPL:src endCLPL:dest];
                
            }];
        } else {
            NSLog(@"geocodeAddressString error:%@", error);
        }
    }];
}

- (void)getRouteWithBeginCLPL:(CLPlacemark *)beginCLPL endCLPL:(CLPlacemark *)endCLPL {
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    
    // 设置起点
//    MKPlacemark *beginCLPL = nil;
    MKPlacemark *beginPL = [[MKPlacemark alloc] initWithPlacemark:beginCLPL];
    MKMapItem *beginItem = [[MKMapItem alloc] initWithPlacemark:beginPL];
    request.source = beginItem;
    
    // 设置终点
//    MKPlacemark *endCLPL = nil;
    MKPlacemark *endPL = [[MKPlacemark alloc] initWithPlacemark:endCLPL];
    MKMapItem *endItem = [[MKMapItem alloc] initWithPlacemark:endPL];
    request.destination = endItem;
    
    // 创建一个获取导航路线的对象
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    
    // 使用导航路线对象, 开始请求, 获取导航路线信息数据
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        if (nil == error) {
//            NSLog(@"success");
            
            [response.routes enumerateObjectsUsingBlock:^(MKRoute * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"name: %@; distance: %f", obj.name, obj.distance);
                
                [self.mapView addOverlay:obj.polyline]; // 获取路线的数据模型
                
                [obj.steps enumerateObjectsUsingBlock:^(MKRouteStep * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSLog(@"instructions: %@", obj.instructions);
                }];
            }];
        } else {
            NSLog(@"calculateETAWithCompletionHandler error:%@", error);
        }
    }];
}

#pragma mark - MKMapViewDelegate start
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    // 导航路线图
//    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
//
//    renderer.lineWidth = 6;
//    renderer.strokeColor = [UIColor cyanColor];
//
//    return renderer;
    
    // 圆形图
    MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
    
    renderer.fillColor = [UIColor blueColor];
    renderer.alpha = .5;
    
    return renderer;
}

#pragma mark - MKMapViewDelegate end

#pragma mark - lazy load
-(CLGeocoder *)geocoder {
    if (nil == _geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

@end


