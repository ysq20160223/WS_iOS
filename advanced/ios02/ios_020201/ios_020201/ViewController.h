//
//  ViewController.h
//  ios_020201
//
//  Created by Apple on 2017/7/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnIcon;

- (IBAction)direction:(id)sender;

- (IBAction)transformRotate:(id)sender;

- (IBAction)transformScale:(id)sender;

- (IBAction)iconIdentity:(id)sender;

@end

