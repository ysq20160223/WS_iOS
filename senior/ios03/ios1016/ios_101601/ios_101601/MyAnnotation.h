//
//  MyAnnotation.h
//  ios_101601
//
//  Created by Apple on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate; // 位置

@property (nonatomic, copy, nullable) NSString *title; // 标题
@property (nonatomic, copy, nullable) NSString *subtitle; // 子标题


@end


