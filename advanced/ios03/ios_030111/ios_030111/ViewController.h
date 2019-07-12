//
//  ViewController.h
//  ios_030111
//
//  Created by Apple on 2017/7/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *telephoneField;

@property (weak, nonatomic) IBOutlet UITextField *addressField;


// 
- (IBAction)exitKeyboard:(id)sender;

@end

