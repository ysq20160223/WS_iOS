//
//  BdMapTool.h
//  ios_101606
//
//  Created by Apple on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <BaiduMapAPI/BMapKit.h>

#import "Single.h"

typedef void(^ResultBlock)(NSArray <BMKPoiInfo *> *poiArray);

@interface BdMapTool : NSObject

singleH(BdMapTool)

- (void)getPoiWithCenter:(CLLocationCoordinate2D)center andKeyWord:(NSString *)key result:(ResultBlock)resultBlock;

-(void)addAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubtitle:(NSString *)subtitle toMapView:(BMKMapView *)mapView;

@end
