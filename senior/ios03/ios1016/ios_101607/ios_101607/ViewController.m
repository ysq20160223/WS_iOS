//
//  ViewController.m
//  ios_101607
//
//  Created by Apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "BdMapTool.h"


@interface ViewController () <BMKMapViewDelegate>

@property (weak, nonatomic) IBOutlet BMKMapView *mapView;

@end



@implementation ViewController

#pragma mark - BMKMapViewDelegate start
- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate {
    BMKCoordinateSpan span = BMKCoordinateSpanMake(0.006517, 0.004069);
    
    float lat = 22.539999;
    float lon = 114.111111;
    
    CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(lat, lon);
    
    BMKCoordinateRegion region = BMKCoordinateRegionMake(coor, span);
    [_mapView setRegion:region animated:YES];
    
    // 发起检索
    [[BdMapTool shareBdMapTool] getPoiWithCenter:coor andKeyWord:@"银行" result:^(NSArray<BMKPoiInfo *> *poiArray) {
        [poiArray enumerateObjectsUsingBlock:^(BMKPoiInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [[BdMapTool shareBdMapTool] addAnnotationWithCoordinate:obj.pt andTitle:obj.name andSubtitle:obj.address toMapView:self.mapView];
        }];
    }];
    
}

- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"%f, %f", mapView.region.span.latitudeDelta, mapView.region.span.longitudeDelta);
}
#pragma mark - BMKMapViewDelegate end

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
}

@end


