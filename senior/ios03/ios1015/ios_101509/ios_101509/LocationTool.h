//
//  LocationTool.h
//  ios_101509
//
//  Created by Apple on 2017/9/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

#import "Single.h"

typedef void(^ResultBlock)(CLLocation *location, CLPlacemark *plackmark, NSString *error);


@interface LocationTool : NSObject

singleH(LocationTool)

- (void)getLocation:(ResultBlock)block;

@end

