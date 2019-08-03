//
//  ViewController.h
//  ios_020601
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barBtnTrash;

//
- (IBAction)add:(UIBarButtonItem *)sender;
- (IBAction)trash:(UIBarButtonItem *)sender;


// 监听每一行的删除按钮
- (IBAction)deleteClick:(UIButton *)btn;

@end



