//
//  ViewController.m
//  ios_101600
//
//  Created by Apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *manager;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initMapView];
}

- (void)initMapView {
    
    // MKMapTypeStandard = 0, // 标准
    // MKMapTypeSatellite, // 卫星
    // MKMapTypeHybrid, // 混合
    // MKMapTypeSatelliteFlyover NS_ENUM_AVAILABLE(10_11, 9_0), // 3D立体卫星
    // MKMapTypeHybridFlyover NS_ENUM_AVAILABLE(10_11, 9_0), // 3D立体混合
    
    self.mapView.mapType = MKMapTypeStandard; // 地图类型
    
//    self.mapView.scrollEnabled = YES; // 滚动
//    self.mapView.rotateEnabled = YES; // 旋转
//    self.mapView.zoomEnabled = YES; // 缩放
    
    self.mapView.showsCompass = YES; // 指南针
    self.mapView.showsScale = YES; // 比例尺
    self.mapView.showsTraffic = YES; // 交通
    
    self.mapView.showsPointsOfInterest = YES; // 兴趣点
    self.mapView.showsBuildings = YES; // 建筑物
    
    [self manager]; //
    
    // 只在地图上添加一个蓝点, 标示用户当前位置, 不会自动放大地图, 不会追踪用户的位置信息
    self.mapView.showsUserLocation = YES;
    
    // 在地图上添加一个蓝点, 标示用户当前位置, 回自动放大地图, 自动追踪用户的位置
//    self.mapView.userTrackingMode = MKUserTrackingModeFollow; // 跟随模式
    
//    self.mapView.delegate = self;
    
}

#pragma mark MKMapViewDelegate start

// 获取到用户位置时调用
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    userLocation.title = @"title";
    userLocation.subtitle = @"subtitle";
    
    // 显示当前地图的中心, 在哪个具体的经纬度, 把当前位置移至屏幕中心
    // 方法一 : 不会自动放大地图比例
//    [self.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    
    // 方法二 : 会自动放大地图比例
    CLLocationCoordinate2D coordinate = userLocation.location.coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.027023, 0.018108);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    
    [self.mapView setRegion:region animated:YES]; // 设置地图显示区域
}

// 地图区域改变时调用
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"lat:%f, lon:%f", mapView.region.span.latitudeDelta, mapView.region.span.longitudeDelta);
    
}
#pragma mark MKMapViewDelegate end


#pragma mark lazy load
- (CLLocationManager *)manager {
    if (!_manager) {
        _manager = [[CLLocationManager alloc] init];
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            [_manager requestAlwaysAuthorization];
        }
    }
    return _manager;
}

@end


