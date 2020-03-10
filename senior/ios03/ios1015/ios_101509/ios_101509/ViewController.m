//
//  ViewController.m
//  ios_101509
//
//  Created by Apple on 2017/9/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "LocationTool.h"

@interface ViewController ()

@end



@implementation ViewController


// placemark: 万象城, 万象城, 中国广东省深圳市罗湖区宝安南路1881号 @ <+22.53999900,+114.11111100>
// placemark: 度尾镇, 中国福建省莆田市仙游县 @ <+25.40906700,+118.58108500>
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[LocationTool shareLocationTool] getLocation:^(CLLocation *location, CLPlacemark *plackmark, NSString *error) {
        if ([error length] > 0) {
            NSLog(@"error: %@", error);
        } else {
            NSLog(@"location: %@; placemark: %@", location, plackmark);
        }
    }];
}

@end


