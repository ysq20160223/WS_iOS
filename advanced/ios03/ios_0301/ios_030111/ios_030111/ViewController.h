//
//  ViewController.h
//  ios_030111
//
//  Created by Apple on 2017/7/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfTelephone;
@property (weak, nonatomic) IBOutlet UITextField *tfAddress;


// 
- (IBAction)exitKeyboard:(id)sender;

@end


