//
//  AppDelegate.m
//  ios_01
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds]; // 1
    
    
    UITabBarController *tabBarVc = UITabBarController.alloc.init;
    self.window.rootViewController = tabBarVc; // 2
//    tabBarVc.tabBar.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0 alpha:1];
//    tabBarVc.tabBar.tintColor = [UIColor magentaColor];
    tabBarVc.tabBar.barTintColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    
    // 添加子控制器
    UIViewController *messageVc = UIViewController.alloc.init;
    [messageVc.view setBackgroundColor:UIColor.grayColor];
    messageVc.tabBarItem.title = @"Message";
    messageVc.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor@2x"]; // 自动渲染成蓝色
    messageVc.tabBarItem.badgeValue = @"9";
    [tabBarVc addChildViewController:messageVc];
    // tabBar 控制器会把自己的子控制器的 view 添加到自己身上
    // 默认 tabBar 控制器会把自己的第一个子控制器的 view 添加到自己身上
    
    //
    UIViewController *contactsVc = UIViewController.alloc.init;
    [contactsVc.view setBackgroundColor:UIColor.magentaColor];
    contactsVc.tabBarItem.title = @"Contacts";
    contactsVc.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    [tabBarVc addChildViewController:contactsVc];
    
    //
    UIViewController *featuredVc = UIViewController.alloc.init;
    [featuredVc.view setBackgroundColor:UIColor.blueColor];
    featuredVc.tabBarItem.title = @"Featured";
    featuredVc.tabBarItem.image = [UIImage imageNamed:@"tab_qworld_nor"];
    [tabBarVc addChildViewController:featuredVc];
    
    //
    UIViewController *settingVc = UIViewController.alloc.init;
    [settingVc.view setBackgroundColor:UIColor.orangeColor];
    settingVc.tabBarItem.title = @"Setting";
    settingVc.tabBarItem.image = [UIImage imageNamed:@"tab_me_nor"];
    [tabBarVc addChildViewController:settingVc];
    
    
    [self.window makeKeyAndVisible]; // 3
    
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
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ios_01"];
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


