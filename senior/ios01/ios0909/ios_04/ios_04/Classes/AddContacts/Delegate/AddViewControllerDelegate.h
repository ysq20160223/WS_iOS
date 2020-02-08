//
//  AddViewControllerDelegate.h
//  ios_04
//
//  Created by Apple on 06/02/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

#ifndef AddViewControllerDelegate_h
#define AddViewControllerDelegate_h

@class AddViewController, Contact;

@protocol AddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(AddViewController *)addVc didAddContact:(Contact *)contact;

@end


#endif /* AddViewControllerDelegate_h */
