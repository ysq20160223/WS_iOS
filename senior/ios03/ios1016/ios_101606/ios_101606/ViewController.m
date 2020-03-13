//
//  ViewController.m
//  ios_101606
//
//  Created by Apple on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

// key : SZXSPvCUNvn1ILw25vsQCBb3QZ79uKYk

#import "ViewController.h"


@interface ViewController () <BMKMapViewDelegate, BMKPoiSearchDelegate>

@property (weak, nonatomic) IBOutlet BMKMapView *mapView;

@property (strong, nonatomic) BMKPoiSearch *search;

@end



@implementation ViewController

#pragma mark - BMKPoiSearchDelegate start

- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode {
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        
        //        NSLog(@"poiResult : %@", poiResult);
        [poiResult.poiInfoList enumerateObjectsUsingBlock:^(BMKPoiInfo *_Nonnull poiInfo, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSLog(@"name: %@, address: %@; latitude:%f, longitude: %f", poiInfo.name, poiInfo.address, poiInfo.pt.latitude, poiInfo.pt.longitude);
            
            BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
            
            annotation.coordinate = poiInfo.pt;
            annotation.title = poiInfo.name;
            annotation.subtitle = poiInfo.address;
            //
            [self.mapView addAnnotation:annotation];
        }];
    } else if (errorCode == BMK_SEARCH_AMBIGUOUS_KEYWORD) {
        NSLog(@"ambiguous keyword");
    } else {
        NSLog(@"errorCode: %u", errorCode);
    }
}
#pragma mark - BMKPoiSearchDelegate end


#pragma mark - BMKMapViewDelegate start
- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate {
    BMKCoordinateSpan span = BMKCoordinateSpanMake(0.009330, 0.005812);
    
    float lat = 22.539999;
    float lon = 114.111111;
    
    CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(lat, lon);
    
    BMKCoordinateRegion region = BMKCoordinateRegionMake(coor, span);
    [_mapView setRegion:region animated:YES];
    
    // 发起检索
    // 发起检索
    BMKNearbySearchOption *option = [[BMKNearbySearchOption alloc] init];
    
    option.pageIndex = 0;
    option.pageCapacity = 3;
    
    option.location = coor;
    option.keyword = @"银行";
    
    BOOL flag = [self.search poiSearchNearBy:option];
    if (flag) {
        NSLog(@"poi search success");
    } else {
        NSLog(@"poi search failure");
    }
}

- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"%f, %f", mapView.region.span.latitudeDelta, mapView.region.span.longitudeDelta);
}

#pragma mark - BMKMapViewDelegate end

#pragma mark - lazy load
- (BMKPoiSearch *)search {
    if (!_search) {
        _search = [[BMKPoiSearch alloc] init];
        _search.delegate = self;
    }
    return _search;
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
}

@end


