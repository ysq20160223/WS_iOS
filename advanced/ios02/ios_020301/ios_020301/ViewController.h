//
//  ViewController.h
//  ios_020301
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *imageNo;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *imageDesc;

@property (weak, nonatomic) IBOutlet UIView *settingView;


//
- (IBAction)sliderValueChange:(UISlider *)sender;

- (IBAction)setting;

//
- (IBAction)nightMode:(UISwitch *)sender;

- (IBAction)imageSizeChange:(UISlider *)sender;

@end

