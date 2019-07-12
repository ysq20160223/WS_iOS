//
//  ViewController.h
//  ios_0102
//
//  Created by Apple on 2017/7/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 声明两个属性用来保存2个文本输入框
@property (nonatomic, weak)IBOutlet UITextField *uiTf1;
@property (nonatomic, weak)IBOutlet UITextField *uiTf2;

//
@property (nonatomic, weak)IBOutlet UILabel *uiLbl;

// 声明一个方法来监听按钮点击 - IBAction == void
- (IBAction)btnClick;

@end

