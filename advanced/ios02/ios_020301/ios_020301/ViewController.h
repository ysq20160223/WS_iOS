//
//  ViewController.h
//  ios_020301
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnSetting;
@property (weak, nonatomic) IBOutlet UILabel *lblNo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
@property (weak, nonatomic) IBOutlet UISlider *slideContent;

@property (weak, nonatomic) IBOutlet UIView *viewSetting;
@property (weak, nonatomic) IBOutlet UISwitch *switchDayNight;


//
- (IBAction)contentSliderValueChange:(UISlider *)sender;

- (IBAction)onClickSetting;

//
- (IBAction)onClickDayNightMode:(UISwitch *)sender;

- (IBAction)imageScaleSlideValueChange:(UISlider *)sender;

@end


