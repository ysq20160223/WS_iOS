//
//  AppDelegate.h
//  ios_091708
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
