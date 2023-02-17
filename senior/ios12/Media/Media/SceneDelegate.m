//
//  SceneDelegate.m
//  Media
//
//  Created by Apple on 2020/5/22.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "SceneDelegate.h"

#import "MediaTabBarController.h"
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
        self.window = UIWindow.alloc.init;
    }
    
    // 2
    MediaTabBarController *rootVc = MediaTabBarController.alloc.init;
    self.window.rootViewController = rootVc;
    
    // 3
    [self.window makeKeyAndVisible];
    
    [self addLaunchAnimation];
    [NSThread sleepForTimeInterval:0.5];
    
}

- (void)addLaunchAnimation {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    
//    for (NSInteger i = 0; i < vc.view.subviews.count; i++) {
//        NSLog(@"%ld: %@", i, vc.view.subviews[i]);
//    }
    
    UIWindow *mainWindow = UIApplication.sharedApplication.keyWindow;
    [mainWindow addSubview:vc.view];
    
    [self.window bringSubviewToFront:vc.view];
    
    long timestamp = NSDate.date.timeIntervalSince1970;
    double scale = timestamp % 2 ? 2.0f: 0.2f;
    NSLog(@"timestamp: %ld; scale: %f", timestamp, scale);
    
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        vc.view.alpha = 0.0f;
        vc.view.subviews[0].layer.transform = CATransform3DScale(CATransform3DIdentity, scale, scale, scale);
    } completion:^(BOOL finished) {
        [vc.view removeFromSuperview];
    }];
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
