//
//  AppDelegate.m
//  Media
//
//  Created by Apple on 2020/5/22.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

#import "SJVideoPlayer.h"
#import "SJRotationManager.h"

@interface AppDelegate ()

@end



@implementation AppDelegate

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    UIInterfaceOrientationMask mask = [SJRotationManager supportedInterfaceOrientationsForWindow:window];
//    NSLog(@"orientations: %ld", mask);
    return mask;
}

#pragma mark -
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1, 获取音频会话
    AVAudioSession *session = AVAudioSession.sharedInstance;

    // 2, 设置为后台类型
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];

    // 3, 激活会话
    [session setActive:YES error:nil];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [UISceneConfiguration.alloc initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    XLog
}


@end
