//
//  ViewController.m
//  ios_101508
//
//  Created by Apple on 2017/9/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "INTULocationManager.h"

@interface ViewController ()

@end



@implementation ViewController

// 持续请求
- (IBAction)subscribeToLocationUpdates:(UIButton *)sender {

    INTULocationManager *manager = [INTULocationManager sharedInstance];
    
    [manager subscribeToLocationUpdatesWithDesiredAccuracy:INTULocationAccuracyHouse block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
        if (status == INTULocationStatusSuccess) {
            NSLog(@"currentLocation: %@", currentLocation);
        } else {
            NSLog(@"status: %ld", status);
        }
    }];
    
}

// 单次请求
- (IBAction)requestLocation:(UIButton *)sender {
    
    INTULocationManager *manager = [INTULocationManager sharedInstance];
    
    // delayUntilAuthorized:YES (从用户选择后开始计算)
    INTULocationRequestID requestId = [manager requestLocationWithDesiredAccuracy:INTULocationAccuracyCity timeout:3 delayUntilAuthorized:NO block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
        if (status == INTULocationStatusSuccess) {
            NSLog(@"currentLocation: %@", currentLocation);
        } else {
            NSLog(@"status: %ld", status);
        }
    }];
    
    [[INTULocationManager sharedInstance] forceCompleteLocationRequest:requestId]; // 仅仅对单次请求有效
//    [[INTULocationManager sharedInstance] cancelLocationRequest:requestId]; // 取消请求
}

@end


