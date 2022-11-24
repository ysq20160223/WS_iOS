//
//  AddVcDelegate.h
//  ios_04
//
//  Created by Apple on 06/02/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

#ifndef AddVcDelegate_h
#define AddVcDelegate_h

@class AddVc, Contact;

@protocol AddVcDelegate <NSObject>

@optional
- (void)addVc:(AddVc *)addVc didAddContact:(Contact *)contact;

@end


#endif /* AddVcDelegate_h */
