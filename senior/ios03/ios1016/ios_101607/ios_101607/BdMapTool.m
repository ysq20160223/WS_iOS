//
//  BdMapTool.m
//  ios_101606
//
//  Created by Apple on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BdMapTool.h"

@interface BdMapTool() <BMKPoiSearchDelegate>
@property (strong, nonatomic) BMKPoiSearch *search;

@property (strong, nonatomic) ResultBlock resultBlock;

@end

@implementation BdMapTool

singleM(BdMapTool)

-(void)addAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubtitle:(NSString *)subtitle toMapView:(BMKMapView *)mapView {
    
    NSLog(@"name:%@, address:%@; lat:%f, lon:%f", title, subtitle, coordinate.latitude, coordinate.longitude);
    
    BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
    
    annotation.coordinate = coordinate;
    annotation.title = title;
    annotation.subtitle = subtitle;
    
    [mapView addAnnotation:annotation];
}


- (void)getPoiWithCenter:(CLLocationCoordinate2D)center andKeyWord:(NSString *)key result:(ResultBlock)resultBlock {
    self.resultBlock = resultBlock;
    
    [self beginSearchWithCenter:center andKeyWord:key];
    
}

- (void)beginSearchWithCenter:(CLLocationCoordinate2D)center andKeyWord:(NSString *)key {
    // 发起检索
    BMKNearbySearchOption *option = [[BMKNearbySearchOption alloc] init];
    
    option.pageIndex = 0;
    option.pageCapacity = 3;
    
    option.location = center;
    option.keyword = key;
    
    BOOL flag = [self.search poiSearchNearBy:option];
    if (flag) {
        NSLog(@"poi search success");
    } else {
        NSLog(@"poi search failure");
    }
}

#pragma mark BMKPoiSearchDelegate start

- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode {
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        
        self.resultBlock(poiResult.poiInfoList);
        
    } else if (errorCode == BMK_SEARCH_AMBIGUOUS_KEYWORD) {
        NSLog(@"ambiguous keyword");
        
    } else {
        NSLog(@"errorCode : %zd", errorCode);
        
    }
    
}

#pragma mark BMKPoiSearchDelegate end

#pragma mark lazy load
- (BMKPoiSearch *)search {
    if (!_search) {
        _search = [[BMKPoiSearch alloc] init];
        _search.delegate = self;
    }
    return _search;
}

@end




