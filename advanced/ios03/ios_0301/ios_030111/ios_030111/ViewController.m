//
//  ViewController.m
//  ios_030111
//
//  Created by Apple on 2017/7/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "UIView+X.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1, 加载 xib
//   UIToolbar *keyboard = [NSBundle.mainBundle loadNibNamed:@"keyboard" owner:nil options:nil][0];
    UIToolbar *keyboard = (UIToolbar *)[UIView xLoadNibNamed:@"keyboard"];
    
    // 2
    self.tfName.inputAccessoryView = keyboard; // 设置键盘上面的工具条
    
//    self.tfTelephone.inputAccessoryView = keyboard;
//    self.tfAddress.inputAccessoryView = keyboard;
//    [self.tfName becomeFirstResponder]; //
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self exitKeyboard:nil];
}


// 响应者 : 能处理事件的对象
// 第一响应者 : 呼出键盘的那个文本框控件
// 退出键盘的原理 : 某个文本框控件不想当第一响应者
- (IBAction)exitKeyboard:(id)sender {
    [UIView animateWithDuration:1 animations:^{
//        [self.tfName resignFirstResponder];
        [self.view endEditing:YES]; // view 内部
    }];
}

@end


