//
//  ViewController.h
//  ios_020301
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *lbNo;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *lbDesc;
@property (weak, nonatomic) IBOutlet UISlider *contentSlide;

@property (weak, nonatomic) IBOutlet UIView *settingView;


//
- (IBAction)contentSliderValueChange:(UISlider *)sender;

- (IBAction)setting;

//
- (IBAction)nightMode:(UISwitch *)sender;

- (IBAction)imageScaleSlideValueChange:(UISlider *)sender;

@end

