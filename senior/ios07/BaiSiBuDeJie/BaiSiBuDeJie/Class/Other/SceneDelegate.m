#import "SceneDelegate.h"

#import "XTabBarController.h"
#import "BSConst.h"


@interface SceneDelegate () <UITabBarControllerDelegate>

@property (nonatomic, strong) UIWindow *statusWindow;

@property (nonatomic, assign) NSInteger lastSelectedIndex;

@end



@implementation SceneDelegate

#pragma mark - UITabBarControllerDelegate start

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//    NSLog(@"%@; %@", tabBarController, viewController);
    if (tabBarController.selectedIndex == self.lastSelectedIndex) {
        // 发出通知
        [[NSNotificationCenter defaultCenter] postNotificationName:TabBarBtnDidRepeatClickNotification object:nil];
        
        //
        self.lastSelectedIndex = -1;
        return;
    }
    self.lastSelectedIndex = tabBarController.selectedIndex;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.lastSelectedIndex = -1;
    });
}

#pragma mark - UITabBarControllerDelegate end

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
//    NSLog(@"");
    
    // 1
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    
    // 2
    XTabBarController *rootVc = [XTabBarController.alloc init];
    rootVc.delegate = self;
    self.window.rootViewController = rootVc;
    
    
    // 3
    [self.window makeKeyAndVisible];
    
//    //
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.statusWindow = [[UIWindow alloc] init];
//        self.statusWindow.frame = [UIApplication sharedApplication].statusBarFrame;
//        self.statusWindow.backgroundColor = [UIColor cyanColor];
//        self.statusWindow.windowLevel = UIWindowLevelAlert;
//        self.statusWindow.hidden = NO;
//        [self.statusWindow addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(statusWindowClick:)]];
//    });
    
    self.lastSelectedIndex = -1;
    
    [NSThread sleepForTimeInterval:1];
}

//- (void)statusWindowClick:(UIWindow *)statusWindow {
//    XLog
//    
//}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
