//
//  AppDelegate.m
//  ios_08
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    
}

@end



@implementation AppDelegate

/*
 090208
 01, UIWindow 是一个特殊的 UIView, 通常在一个 app 中至少会有一个 UIWindow
 02, 启动完毕后, 创建的第一个视图控件就是 UIWindow , 接着创建 vc view, 最后将 vc 的 view 添加到 UIWindow 上
 
 090209
 状态栏是一个比较特殊的 UIWindow; 键盘也是一个 UIWindow
 
 */

- (void)createRect {
    // 1
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 300, 660)];
    self.window.backgroundColor = [UIColor blueColor];
    
    // 2
    UIViewController *rootVC = [[UIViewController alloc] init];
    rootVC.view.backgroundColor = [UIColor magentaColor];
    self.window.rootViewController = rootVC;
    
    // 3
    self.window.hidden = NO;
    
}

- (void)createScreen {
    // 01, 创建 UIWindow 对象
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor magentaColor];
    
    // 02, 创建 UIWindow 的 ViewController, 并赋值
    UIViewController *rootVC = [[UIViewController alloc] init];
    rootVC.view.backgroundColor = [UIColor cyanColor];
    self.window.rootViewController = rootVC; // 一旦设置窗口的根控制器, 就会将根控制器的 view 添加到窗口
    
    // 03, 显示窗口
    [self.window makeKeyAndVisible]; // 可以显示窗口; 成为应用程序的主窗口
//    self.window.windowLevel = UIWindowLevelAlert; // Alert > StatusBar > Normal
//    NSLog(@"normal: %f, status: %f, alert: %f", UIWindowLevelNormal, UIWindowLevelStatusBar, UIWindowLevelAlert);
    
    
    //
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = CGPointMake(100, 100);
    [rootVC.view addSubview:btn];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 加载 Info.plist, 并且判断如果没有 main, 就不会创建窗口
    
//    [self createScreen]; // 方式一
    [self createRect]; // 方式二
    
    
    // 090209 : 如果要弹出键盘, 必须要把文本框添加到某个控件
    UITextField *field = [[UITextField alloc] init];
    field.frame = CGRectMake(20, 300, 200, 300);
    field.backgroundColor = [UIColor yellowColor];
//    [field becomeFirstResponder];
    [self.window addSubview:field];
    
    NSLog(@"windows: %@", application.windows);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ios_08"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
