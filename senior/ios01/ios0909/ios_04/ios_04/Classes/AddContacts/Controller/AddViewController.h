//
//  AddViewController.h
//  ios_04
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AddViewControllerDelegate.h"

@class AddViewController, Contact;
//
//@protocol AddViewControllerDelegate <NSObject>
//
//@optional
//- (void)addViewController:(AddViewController *)addVc didAddContact:(Contact *)contact;
//
//@end




@interface AddViewController : UIViewController

@property (nonatomic, weak) id<AddViewControllerDelegate> delegate;

//@property (nonatomic, weak) ContactsViewController *contactVc;

@end
