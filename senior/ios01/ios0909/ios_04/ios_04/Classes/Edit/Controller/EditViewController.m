//
//  EditViewController.m
//  ios_04
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end





@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 及时监听文本框输入
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}

// 文本改变
- (void)textChange {
    //    NSLog(@"%@", _accountField.text);
    _saveBtn.enabled = _nameField.text.length && _phoneField.text.length;
}


@end




