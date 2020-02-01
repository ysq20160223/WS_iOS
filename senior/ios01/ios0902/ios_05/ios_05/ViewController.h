//
//  ViewController.h
//  ios_05
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@interface ViewController : UIViewController

- (IBAction)badge:(UIButton *)sender;

- (IBAction)notification:(UIButton *)sender;

- (IBAction)networkVisible:(UIButton *)sender;


- (IBAction)setStatusBar:(UIButton *)sender;

- (IBAction)openUrl:(UIButton *)sender;

@end

