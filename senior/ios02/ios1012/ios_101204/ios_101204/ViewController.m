//
//  ViewController.m
//  ios_101204
//
//  Created by Apple on 2017/8/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"


@interface ViewController ()

@end



@implementation ViewController

// 2
- (void)reachability {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


// 1
- (void)afn {
    // 1
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 2
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知
                NSLog(@"AFNetwork Reachability Status Unknown");
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 未联网
                NSLog(@"AFNetwork Reachability Not Reachable");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // wifi
                NSLog(@"AFNetwork Reachability Reachable Via WiFi");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // cellular
                NSLog(@"AFNetwork Reachability Reachable Via WWAN");
                break;
        }
    }];
    
    // 3
    [manager startMonitoring];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self afn];
    
    [self reachability];
}

@end


