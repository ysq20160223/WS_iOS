//
//  AppDelegate.h
//  ios_020215
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong, readonly) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

