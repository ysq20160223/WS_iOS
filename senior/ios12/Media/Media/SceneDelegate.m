//
//  SceneDelegate.m
//  Media
//
//  Created by Apple on 2020/5/22.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "SceneDelegate.h"

#import "AudioVc.h"


@interface SceneDelegate ()

@end



@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    // 1
    if (@available(iOS 13.0, *)) {
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [UIWindow.alloc initWithWindowScene:windowScene];
        self.window.frame = windowScene.coordinateSpace.bounds;
    } else {
        // Fallback on earlier versions
        self.window = [UIWindow.alloc init];
    }
    
    // 2
    AudioVc *rootVc = [AudioVc.alloc init];
    self.window.rootViewController = rootVc;
    
    // 3
    [self.window makeKeyAndVisible];
    
    [NSThread sleepForTimeInterval:0.5];
    
}


- (void)sceneDidDisconnect:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//    XLog
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sceneDidBecomeActive" object:nil];
}


- (void)sceneWillResignActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
//    XLog
}


- (void)sceneWillEnterForeground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
//    XLog
}


- (void)sceneDidEnterBackground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
//    XLog
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sceneDidEnterBackground" object:nil];
}


@end
