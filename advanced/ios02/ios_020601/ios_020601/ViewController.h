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
- (IBAction)onClickAdd:(UIBarButtonItem *)sender;
- (IBAction)onClickTrash:(UIBarButtonItem *)sender;


// 监听每一行的删除按钮
- (IBAction)onClickDelete:(UIButton *)btn;

@end



