//
//  ViewController.m
//  ios_101601
//
//  Created by Apple on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "MyAnnotation.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLGeocoder *geocoder;

@end



@implementation ViewController

// 系统加载 Annotation 视图的实现方案 - 2
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    // 返回 nil 系统加载的流程
    
    static NSString *pinID = @"pinID";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:pinID];
    
    if (nil == view) {
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinID];
    }
    
    view.annotation = annotation; // 重新设置, 防止复用时出错
    
    view.image = [UIImage imageNamed:@"annotation_view"];
    
    view.canShowCallout = YES; // 设置弹框
    
    view.centerOffset = CGPointMake(0, 0); // 添加偏移量
    
    view.calloutOffset = CGPointMake(0, 0); // 弹框偏移量
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    iv.image = [UIImage imageNamed:@"location"];
    
    view.leftCalloutAccessoryView = iv;
//    view = iv; // 左右视图只能设置一个
    
//    view.detailCalloutAccessoryView = [UISwitch new]; // 详情视图
    
    return view;
    
}


/*
// 系统加载 Annotation 视图的实现方案 - 1
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    // 返回 nil 系统加载的流程
    
    static NSString *pinID = @"pinID";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinID];
    
    if (nil == pinView) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinID];
    }
    
    pinView.annotation = annotation; // 重新设置, 防止复用时出错
    
    pinView.canShowCallout = YES; // 设置弹框
    
    //    pinView.pinColor = MKPinAnnotationColorPurple;
    pinView.pinTintColor = [UIColor cyanColor];
    
    //    pinView.animatesDrop = YES;
    
    return pinView;
    
}
*/

// 在地图上标注一个点
- (IBAction)point:(UIButton *)sender {
    
    // 1, 获取当前手指在地图上点的位置
//    CGPoint point = [[touches anyObject] locationInView:self.mapView];
//    NSLog(@"x:%f, y:%f", point.x, point.y);
    CGPoint point = CGPointMake(286.85, 401.43);
    
    // 2, 把 点坐标 转换成 经纬度 坐标
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
    // 3, 添加数据模型
    MyAnnotation *annotation = [self addAnnotationWithCoordinate:coordinate andTitle:@"title" andSubtitle:@"subtitle"];
    
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (nil == error) {
            CLPlacemark *pl = [placemarks firstObject];
            annotation.title = pl.locality;
            annotation.subtitle = pl.name;
        }
    }];
}

// 清除地图上所有的点
- (IBAction)clear:(UIButton *)sender {
    NSArray *annotations = self.mapView.annotations;
    [self.mapView removeAnnotations:annotations];
}

// 添加模型
- (MyAnnotation *)addAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubtitle:(NSString *)subtitle {
    // 1, 创建模型
    MyAnnotation *annotation = [[MyAnnotation alloc] init];
    annotation.coordinate = coordinate;
    annotation.title = title;
    annotation.subtitle = subtitle;
    
    // 2, 添加模型
    [self.mapView addAnnotation:annotation];
    
    return annotation;
}


#pragma mark lazy loading
- (CLGeocoder *)geocoder {
    if (nil == _geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

@end


