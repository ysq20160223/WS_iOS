//
//  AppDelegate.m
//  ios_05
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 01, finish launching
 02, become active
 
 03, resign active
 04, enter background
 
 05, enter foreground
 06, become active
 
 */

#import "AppDelegate.h"

@interface AppDelegate ()

@end



@implementation AppDelegate

// 1, 启动完成
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"");
    return YES;
}

// 2, 完全获取焦点时调用 : 完全获取焦点时才能与用户交互
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"");
}



// 即将失去焦点的时候调用
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"");
}

// 即将进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"");
}

// 即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"");
}




- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"");
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ios_05"];
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
    NSLog(@"%s", __func__);
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
    NSLog(@"%s", __func__);
}

@end




